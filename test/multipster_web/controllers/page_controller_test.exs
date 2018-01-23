defmodule MultipsterWeb.PageControllerTest do
  use MultipsterWeb.ConnCase
  import Plug.Test

  describe "unauthenticated request" do
    test "redirect user to sign in page", %{conn: conn} do
      conn = get(conn, page_path(conn, :index))

      assert redirected_to(conn) =~ "/sign_in_links/new"
    end
  end

  describe "authenticated request" do
    test "display page content", %{conn: conn} do
      user = Multipster.Repo.insert!(%Multipster.User{email: "test@example.com"})

      conn =
        conn
        |> init_test_session(%{user_id: user.id})
        |> get(page_path(conn, :index))

      assert html_response(conn, 200)
    end
  end
end
