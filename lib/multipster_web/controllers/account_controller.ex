defmodule MultipsterWeb.AccountController do
  use MultipsterWeb, :controller
  alias Multipster.Repo
  alias Multipster.User
  alias MultipsterWeb.SignIn.Link

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        Link.send_to_user(user)

        conn
        |> put_flash(:info, "Account created successfully. Please check your mailbox.")
        |> redirect(to: sign_in_link_path(conn, :new))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
