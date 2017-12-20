defmodule Multipster.Comrade do
  use Ecto.Schema
  import Ecto.Changeset
  alias Multipster.Comrade


  schema "comrades" do
    field :context, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Comrade{} = comrade, attrs) do
    comrade
    |> cast(attrs, [:name, :context])
    |> validate_required([:name])
  end
end
