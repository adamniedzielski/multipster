defmodule Multipster.Comrade do
  @moduledoc """
  Central model in the application that represents the person you have a
  relation with.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Multipster.Comrade

  schema "comrades" do
    belongs_to(:user, Multipster.User)
    field(:context, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(%Comrade{} = comrade, attrs) do
    comrade
    |> cast(attrs, [:name, :context])
    |> validate_required([:name, :user_id])
  end
end
