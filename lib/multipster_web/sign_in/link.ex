defmodule MultipsterWeb.SignIn.Link do
  @moduledoc """
  Responsible for sending sign in link to user via email
  """
  alias Multipster.Repo
  alias Multipster.User
  alias MultipsterWeb.SignIn.Token
  alias MultipsterWeb.Email
  alias MultipsterWeb.Mailer

  def send_to_user(user) do
    token = Token.encode(user)

    user.email
    |> Email.sign_in_link(token)
    |> Mailer.deliver_later()
  end

  def send_to_address(address) do
    user = Repo.get_by(User, email: address)

    if user do
      send_to_user(user)
    end
  end
end
