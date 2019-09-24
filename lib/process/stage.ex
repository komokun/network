defmodule Network.Chain.Pipeline.Stage do
  @moduledoc """
   A behaviour module for defining a stage for a pipeline
  """
  @callback call(pipeline :: any()) :: {:ok, any()} | {:error, String.t}
end
