defmodule Network.Chain.Pipeline.BroadcastChainResponse do
  @behaviour Network.Chain.Pipeline.Stage

  require Logger

  def call(pipeline) do
    send pipeline.handler, {:message_from_chain, self(), pipeline.data}
    {:ok, pipeline}
  end
end
