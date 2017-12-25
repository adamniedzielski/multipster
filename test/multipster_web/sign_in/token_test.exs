defmodule MultipsterWeb.SignIn.TokenTest do
  use ExUnit.Case, async: true
  alias MultipsterWeb.SignIn.Token

  test "return user id after encode and decode" do
    token = Token.encode(%Multipster.User{id: 4})
    {:ok, user_id} = Token.decode(token)

    assert user_id == 4
  end

  test "return error when token is invalid" do
    {:error, _} = Token.decode("wrong")
  end
end
