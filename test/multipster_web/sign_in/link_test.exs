defmodule MultipsterWeb.SignIn.LinkTest do
  use Multipster.DataCase, async: true
  use Bamboo.Test

  describe "send_to_address/1" do
    test "send email when user exists" do
      Repo.insert!(%Multipster.User{email: "test@example.com"})

      MultipsterWeb.SignIn.Link.send_to_address("test@example.com")

      assert_delivered_with(
        to: [nil: "test@example.com"],
        subject: "Sign in to Multipster"
      )
    end

    test "do nothing when user doesn't exist" do
      MultipsterWeb.SignIn.Link.send_to_address("wrong@example.com")

      assert_no_emails_delivered()
    end
  end
end
