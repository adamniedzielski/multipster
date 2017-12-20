defmodule MultipsterWeb.InitialContactsController do
  use MultipsterWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
