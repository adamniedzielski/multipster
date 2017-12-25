defmodule MultipsterWeb.SignIn.Token do
  @moduledoc """
  Wraps JOSE to provide encoding and decoding for JWT tokens
  """
  alias JOSE.JWT
  alias JOSE.JWS
  alias JOSE.JWK
  alias MultipsterWeb.Endpoint
  alias Multipster.CurrentTime

  def encode(user) do
    {_, token} =
      key()
      |> JWT.sign(signature(), %{"user_id" => user.id, "exp" => get_expiration()})
      |> JWS.compact()

    token
  end

  def decode(token) do
    with {true, %JWT{fields: claims}, _} <- JWT.verify(key(), token),
         %{"user_id" => user_id, "exp" => exp} <- claims,
         true <- verify_expiration(exp) do
      {:ok, user_id}
    else
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

  defp verify_expiration(expiration) do
    expiration > current_timestamp()
  end

  defp get_expiration do
    current_timestamp() + 30 * 60
  end

  defp current_timestamp do
    CurrentTime.get_timestamp()
  end
end
