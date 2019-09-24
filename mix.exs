defmodule Network.MixProject do
  use Mix.Project

  def project do
    [
      app: :network,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Network.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Core
      {:opus, "~> 0.6"},

      # Networking
      {:ranch, "~> 1.5"},
      {:websockex, "~> 0.4.2"},

      # Utilities
      {:poison, "~> 3.1"},
      {:poolboy, "~> 1.5"}
    ]
  end
end
