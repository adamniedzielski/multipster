defmodule Multipster.SignUpTest do
  use Multipster.FeatureCase, async: true
  import Wallaby.Query

  test "create new user account", %{session: session} do
    session
    |> visit("/accounts/new")
    |> fill_in(Query.text_field("Email"), with: "test@example.com")
    |> click(button("Sign up"))
    |> assert_has(Query.text("Account created successfully"))
  end
end
