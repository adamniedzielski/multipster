defmodule MultipsterWeb.SignIn.TokenTest do
  use ExUnit.Case, async: false
  alias MultipsterWeb.SignIn.Token

  test "return user id after encode and decode" do
    token = Token.encode(%Multipster.User{id: 4})
    {:ok, user_id} = Token.decode(token)

    assert user_id == 4
  end

  test "return error when token is invalid" do
    {:error, _} = Token.decode("wrong")
  end

  test "return error when token expired" do
    token = Token.encode(%Multipster.User{id: 4})

    Multipster.CurrentTime.Mock.freeze(:os.system_time(:second) + 31 * 60)

    {:error, _} = Token.decode(token)

    Multipster.CurrentTime.Mock.unfreeze()
  end
end
