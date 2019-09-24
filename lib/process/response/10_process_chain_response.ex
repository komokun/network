defmodule Network.Chain.Pipeline.Response  do
  use Opus.Pipeline

  require Logger

  step :checkin_chain_server_worker
  step :transform_error_response
  step :transform_success_response
  step :broadcast_chain_response

  def checkin_chain_server_worker(%{pipeline: pipeline}) do
    {:ok, p} = Network.Chain.Pipeline.CheckinChainServerWorker.call(pipeline)
    %{pipeline: p}
  end

  def transform_error_response(%{pipeline: pipeline}) do
    {:ok, p} = Network.Chain.Pipeline.TransformChainErrorResponse.call(pipeline)
    %{pipeline: p}
  end

  def transform_success_response(%{pipeline: pipeline}) do
    {:ok, p} = Network.Chain.Pipeline.TransformChainSuccessResponse.call(pipeline)
    %{pipeline: p}
  end

  def broadcast_chain_response(%{pipeline: pipeline}) do
    {:ok, p} = Network.Chain.Pipeline.BroadcastChainResponse.call(pipeline)
    %{pipeline: p}
  end

end
