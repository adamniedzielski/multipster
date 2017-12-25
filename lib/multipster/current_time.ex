defmodule Multipster.CurrentTime do
  @moduledoc """
  Encapsulates getting current time
  """
  @adapter :multipster
           |> Application.get_env(__MODULE__)
           |> Keyword.fetch!(:adapter)

  def get_timestamp do
    @adapter.get_timestamp()
  end
end
