defmodule MultipsterWeb.SignInLinkController do
  use MultipsterWeb, :controller
  alias MultipsterWeb.SignIn.Attempt
  alias MultipsterWeb.SignIn.Link
  alias Ecto.Changeset

  def new(conn, _params) do
    changeset = Attempt.changeset(%{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"attempt" => attempt_params}) do
    changeset = Attempt.changeset(attempt_params)

    case Changeset.apply_action(changeset, :insert) do
      {:ok, attempt} ->
        Link.send_to_address(attempt.email)

        conn
        |> put_flash(:info, "Sign in link sent to your mailbox.")
        |> redirect(to: sign_in_link_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
