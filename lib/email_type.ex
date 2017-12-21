defmodule EmailType do
  @moduledoc """
  Converts from citext field in Postgres to String type
  """

  @behaviour Ecto.Type
  def type, do: :string

  def load(data) do
    {:ok, String.downcase(data)}
  end

  def cast(data) do
    {:ok, data}
  end

  def dump(data) do
    {:ok, data}
  end
end
