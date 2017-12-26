defmodule Multipster.ViewYourComradesTest do
  use Multipster.FeatureCase, async: true
  alias Multipster.User
  alias Multipster.Comrade

  test "show only comrades that belong to current user", %{session: session} do
    user = Repo.insert!(%User{email: "test@example.com"})
    other_user = Repo.insert!(%User{email: "other@example.com"})

    Repo.insert!(%Comrade{name: "Chris", user: user})
    Repo.insert!(%Comrade{name: "John", user: other_user})

    token = MultipsterWeb.SignIn.Token.encode(user)

    session
    |> visit("sessions/new?token=#{token}")
    |> assert_has(Query.text("You have successfully signed in."))
    |> visit("/comrades")
    |> assert_has(Query.text("Chris"))
    |> refute_has(Query.text("John"))
  end
end
