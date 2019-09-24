defmodule Network.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Get configuration
    config = Application.get_env(:network, :server)

    children = [
      # Add it to supervison tree
      {Network.Server, config},
      Supervisor.Spec.supervisor(Network.Chain, [])
    ]

    opts = [strategy: :one_for_one, name: Network.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
