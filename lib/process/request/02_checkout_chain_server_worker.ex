defmodule Network.Chain.Pipeline.CheckoutChainServerWorker do
  @behaviour Network.Chain.Pipeline.Stage

  require Logger

  def call(pipeline) do

    Logger.info "Checking out XRPL worker..."

    worker = :poolboy.checkout(:xrp_ledger)

    Logger.info "Checked out XRPL worker at #{inspect worker}"

    p = Map.put(pipeline, :xrpl_worker, worker)
    {:ok, p}
  end
end
