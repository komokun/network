defmodule Network.Chain.Pipeline.SendCommandToChain do
  @behaviour Network.Chain.Pipeline.Stage

  require Logger
  def call(pipeline) do
    Logger.warn("Sending message #{inspect pipeline.message} to server #{inspect pipeline.xrpl_worker}")
    :gen_server.cast(pipeline.xrpl_worker, {:transaction, pipeline})
    {:ok, pipeline}
  end
end
