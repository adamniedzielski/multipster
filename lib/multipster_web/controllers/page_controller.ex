defmodule MultipsterWeb.PageController do
  use MultipsterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
