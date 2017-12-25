defmodule Multipster.UserTest do
  use Multipster.DataCase, async: true
  alias Multipster.User

  test "validate uniqueness of email in case insensitive way" do
    first_user = User.changeset(%User{}, %{email: "test@example.com"})
    Repo.insert!(first_user)

    second_user = User.changeset(%User{}, %{email: "TEST@example.com"})
    {:error, changeset} = Repo.insert(second_user)

    assert {"has already been taken", _} = changeset.errors[:email]
  end
end
