defmodule MultipsterWeb.Mailer do
  @moduledoc """
  Delivers emails by wrapping Bamboo
  """
  use Bamboo.Mailer, otp_app: :multipster
end
