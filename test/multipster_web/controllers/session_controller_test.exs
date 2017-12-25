defmodule MultipsterWeb.SessionControllerTest do
  use MultipsterWeb.ConnCase
  import Plug.Test

  test "set session cookie when signing in as a user", %{conn: conn} do
    token = MultipsterWeb.SignIn.Token.encode(%Multipster.User{id: 2})

    conn = get conn, session_path(conn, :new, token: token)

    assert get_session(conn, :user_id) == 2
  end

  test "clear session cookie when signing out", %{conn: conn} do
    conn =
      conn
      |> init_test_session(%{user_id: 3})
      |> delete(session_path(conn, :delete))

    assert get_session(conn, :user_id) == nil
  end
end
