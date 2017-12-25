defmodule Multipster.SendSignInLinkTest do
  use Multipster.FeatureCase
  use Bamboo.Test, shared: true
  import Wallaby.Query

  test "send sign in link to existing user", %{session: session} do
    Repo.insert!(%Multipster.User{email: "test@example.com"})

    session
    |> visit("/sign_in_links/new")
    |> fill_in(Query.text_field("Email"), with: "test@example.com")
    |> click(button("Sign in"))
    |> assert_has(Query.text("Sign in link sent to your mailbox"))

    assert_delivered_with(
      to: [nil: "test@example.com"],
      subject: "Sign in to Multipster"
    )
  end
end
