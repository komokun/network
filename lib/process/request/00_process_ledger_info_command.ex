defmodule Network.Chain.Pipeline.Request  do
  use Opus.Pipeline

  require Logger

  step :prepare_request_payload
  step :check_out_chain_server_worker
  step :send_command_to_chain


  def prepare_request_payload(%{pipeline: pipeline}) do

    {:ok, s} = Network.Chain.Pipeline.ValidateRequestPayload.call(pipeline)
    %{pipeline: s}
  end

  def check_out_chain_server_worker(%{pipeline: pipeline}) do

    {:ok, s} = Network.Chain.Pipeline.CheckoutChainServerWorker.call(pipeline)
    %{pipeline: s}
  end

  def send_command_to_chain(%{pipeline: pipeline}) do
    {:ok, s} = Network.Chain.Pipeline.SendCommandToChain.call(pipeline)
    %{pipeline: s}
  end

end
