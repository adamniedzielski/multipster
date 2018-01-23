defmodule MultipsterWeb.SessionController do
  use MultipsterWeb, :controller
  alias MultipsterWeb.SignIn.Token

  def new(conn, %{"token" => token}) do
    case Token.decode(token) do
      {:ok, user_id} ->
        conn
        |> put_session(:user_id, user_id)
        |> put_flash(:info, "You have successfully signed in.")
        |> redirect(to: page_path(conn, :index))

      _ ->
        conn
        |> put_flash(:error, "Something is wrong with your sign in link. Please try again.")
        |> redirect(to: sign_in_link_path(conn, :new))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "You have successfully signed out.")
    |> redirect(to: sign_in_link_path(conn, :new))
  end
end
