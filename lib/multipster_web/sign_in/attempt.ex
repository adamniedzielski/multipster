defmodule MultipsterWeb.SignIn.Attempt do
  @moduledoc """
  Represents an attempt to authenticate to the application by providing an
  email address
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :email
  end

  def changeset(attrs) do
    %MultipsterWeb.SignIn.Attempt{}
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
