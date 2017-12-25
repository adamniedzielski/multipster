defmodule MultipsterWeb.SessionControllerTest do
  use MultipsterWeb.ConnCase

  test "set session cookie when sign in as a user", %{conn: conn} do
    token = MultipsterWeb.SignIn.Token.encode(%Multipster.User{id: 2})

    conn = get conn, session_path(conn, :new, token: token)

    assert get_session(conn, :user_id) == 2
  end
end
