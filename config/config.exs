use Mix.Config

config :network, :server,
  port: String.to_integer(System.get_env("PORT") || "5555")
