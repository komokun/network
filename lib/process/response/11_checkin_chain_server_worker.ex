defmodule Network.Chain.Pipeline.CheckinChainServerWorker do
  @behaviour Network.Chain.Pipeline.Stage

  require Logger

  def call(pipeline) do

    Logger.info "Checking in XRPL worker..."
    :poolboy.checkin(:xrp_ledger, pipeline.xrpl_worker)
    Logger.info "Checked in XRPL worker #{inspect pipeline.xrpl_worker}"

    {:ok, pipeline}
  end
end
