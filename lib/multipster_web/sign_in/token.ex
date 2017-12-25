defmodule MultipsterWeb.SignIn.Token do
  @moduledoc """
  Wraps JOSE to provide encoding and decoding for JWT tokens
  """
  alias JOSE.JWT
  alias JOSE.JWS
  alias JOSE.JWK
  alias MultipsterWeb.Endpoint

  def encode(user) do
    {_, token} =
      key()
      |> JWT.sign(signature(), %{"user_id" => user.id})
      |> JWS.compact()

    token
  end

  def decode(token) do
    case JWT.verify(key(), token) do
      {true, %JWT{fields: %{"user_id" => user_id}}, _} ->
        {:ok, user_id}
      _ ->
        {:error, ""}
    end
  end

  defp key do
    :secret_key_base
    |> Endpoint.config
    |> JWK.from_oct
  end

  defp signature do
    %{"alg" => "HS512"}
  end
end
