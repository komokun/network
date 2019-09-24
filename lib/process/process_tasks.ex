defmodule Network.Chain.Process.Task.Request do
  use Task
  require Logger
  def start_link(args \\ []) do
    Task.start_link(Network.Chain.Process.Task.Request, :run, args)
  end

  def run(args) do

    pipeline = %{handler: args[:handler], message: args[:message]}
    Logger.info("Starting request pipeline...")
    case Network.Chain.Pipeline.Request.call(%{pipeline: pipeline}) do
      {:ok, _s}
        ->  Logger.warn("Chain Process Pipeline Request Success.")
      {:error, _e}
        ->  Logger.error("Chain Process Pipeline Request Error.")
    end
    {:noreply}
  end
end

defmodule Network.Chain.Process.Task.Response do
  use Task
  require Logger
  def start_link(args \\ []) do
    Task.start_link(Network.Chain.Process.Task.Response, :run, args)
  end

  def run(args) do

    pipeline = %{handler: args[:handler], data: args[:data], xrpl_worker: args[:xrpl_worker]}
    Logger.info("Starting response pipeline...")
    case Network.Chain.Pipeline.Response.call(%{pipeline: pipeline}, only: [:checkin_chain_server_worker, :broadcast_chain_response]) do
      {:ok, _s}
        ->  Logger.warn("Chain Process Pipeline Response Success.")
      {:error, e}
        ->  Logger.error("Chain Process Pipeline Response Error. #{inspect e}")
    end
    {:noreply}
  end
end
