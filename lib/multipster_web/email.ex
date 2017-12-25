defmodule MultipsterWeb.Email do
  @moduledoc """
  Generates all email messages
  """
  use Bamboo.Phoenix, view: MultipsterWeb.EmailView

  def sign_in_link(receiver, token) do
    new_email()
    |> to(receiver)
    |> from("multipster@multipster.test")
    |> subject("Sign in to Multipster")
    |> assign(:token, token)
    |> render("sign_in_link.html")
  end
end
