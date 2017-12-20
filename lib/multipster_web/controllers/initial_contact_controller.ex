defmodule MultipsterWeb.InitialContactController do
  alias Multipster.Comrade
  alias Multipster.Repo
  use MultipsterWeb, :controller

  def new(conn, _params) do
    changeset = Comrade.changeset(%Comrade{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"comrade" => comrade_params}) do
    changeset = Comrade.changeset(%Comrade{}, comrade_params)

    case Repo.insert(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Contact recorded successfully.")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
