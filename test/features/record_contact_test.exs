defmodule Multipster.RecordContactTest do
  use Multipster.FeatureCase, async: true
  import Wallaby.Query

  test "record initial contact", %{session: session} do
    session
    |> visit("/initial_contacts/new")
    |> fill_in(Query.text_field("Name"), with: "Chris")
    |> fill_in(Query.text_field("Context"), with: "Elixir meetup")
    |> click(button("Record"))
    |> assert_has(Query.text("Contact recorded successfully"))
    |> visit("/comrades")
    |> assert_has(Query.text("Chris"))
    |> assert_has(Query.text("Elixir meetup"))
  end
end
