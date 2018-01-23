defmodule MultipsterWeb.SignIn.Plug do
  @moduledoc """
  Authenticates user from session.
  Redirects to sign in page when user is not authenticated.
  """
  import Plug.Conn
  alias Multipster.Repo
  alias Multipster.User
  alias Phoenix.Controller

  def init(options), do: options

  def call(conn, _options) do
    with user_id when not is_nil(user_id) <- get_session(conn, :user_id),
         user when not is_nil(user) <- Repo.get(User, user_id) do
      assign(conn, :current_user, user)
    else
      _ ->
        conn
        |> Controller.put_flash(:error, "You have to sign in to access this page.")
        |> Controller.redirect(to: "/sign_in_links/new")
        |> halt
    end
  end
end
