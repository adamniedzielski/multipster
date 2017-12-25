defmodule MultipsterWeb.SignIn.PlugTest do
  use MultipsterWeb.ConnCase, async: true
  import Plug.Test

  test "redirect to sign in page when session is empty", %{conn: conn} do
    conn =
      conn
      |> bypass_through(MultipsterWeb.Router, [:browser])
      |> get("/")
      |> MultipsterWeb.SignIn.Plug.call([])

    assert redirected_to(conn) =~ "/sign_in_links/new"
  end

  test "redirect to sign in page when user does not exist", %{conn: conn} do
    conn =
      conn
      |> init_test_session(%{user_id: 1})
      |> bypass_through(MultipsterWeb.Router, [:browser])
      |> get("/")
      |> MultipsterWeb.SignIn.Plug.call([])

    assert redirected_to(conn) =~ "/sign_in_links/new"
  end

  test "assign current user when session is populated and user exists", %{conn: conn} do
    user = Multipster.Repo.insert!(%Multipster.User{email: "test@example.com"})

    conn =
      conn
      |> init_test_session(%{user_id: user.id})
      |> bypass_through(MultipsterWeb.Router, [:browser])
      |> get("/")
      |> MultipsterWeb.SignIn.Plug.call([])

    assert conn.assigns[:current_user] == user
  end
end
