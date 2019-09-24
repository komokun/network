defmodule Network.Chain do
  use Supervisor
  require Logger

  @xrpl_ws :xrpl_ws
  @xrp_ledger :xrp_ledger

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, [], opts)
  end

  def init([]) do

    ws_opts = [
      name: {:local, @xrpl_ws},
      worker_module: Network.Chain.Client,
      size: 2,
      max_overflow: 0,
      strategy: :fifo
    ]

    ledger_opts = [
      name: {:local, @xrp_ledger},
      worker_module: Network.Chain.Server,
      size: 2,
      max_overflow: 0,
      strategy: :fifo
    ]

    children = [
        :poolboy.child_spec(@xrpl_ws, ws_opts, url: "wss://s.altnet.rippletest.net:51233"),
        :poolboy.child_spec(@xrp_ledger, ledger_opts)
    ]

    Logger.info "Starting Ledger Server and Socket Connection(s)..."
    supervise(children, strategy: :one_for_one, name: Network.Chain)
  end

end
