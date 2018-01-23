defmodule Multipster.User do
  @moduledoc """
  Represents user account for the purpose of authentication and data
  ownership
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Multipster.User

  schema "users" do
    has_many(:comrades, Multipster.Comrade)
    field(:email, EmailType)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
