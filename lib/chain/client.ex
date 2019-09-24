defmodule Network.Chain.Client do
  use WebSockex

  require Logger

  def start_link(args) do
    WebSockex.start_link(args[:url], __MODULE__, args)
  end

  def handle_frame({:text, message}, state) do
    Logger.warn("Sending message #{inspect message} to handler #{inspect state.pipeline.handler}")

    spawn(Network.Chain.Process.Task.Response, :run,
          [%{handler: state.pipeline.handler, xrpl_worker: state.pipeline.xrpl_worker, data: message}])
    #send state.pipeline.handler, {:message_from_chain, self(), message}
    {:ok, state}
  end

  def handle_cast({:pipeline, pipeline}, _state) do
    {:ok, %{pipeline: pipeline}}
  end

end
