defmodule Network.Chain.Server do
  use GenServer
  require Logger
  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    {:ok, %{dispatcher: args[:dispatcher]}}
  end

  def handle_cast({:transaction, %{handler: _handler, message: message} = pipeline}, state) do

    Logger.info("Sending cast to worker #{inspect pipeline}")
    :poolboy.transaction(:xrpl_ws, fn(ws_connection_worker) ->
        WebSockex.cast(ws_connection_worker, {:pipeline, pipeline})
        send_message(ws_connection_worker, message)
      end)

    {:noreply, state}
  end

  def handle_info(:timeout, _) do
		Logger.info "shutting down"
		{:stop, :normal, []}
	end

  def send_message(ws_connection_worker, message) do
    Logger.info("Sending message to XRP Ledger to worker #{inspect ws_connection_worker}")
    WebSockex.send_frame(ws_connection_worker, {:text, message})
  end
end
