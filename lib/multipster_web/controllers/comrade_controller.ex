defmodule MultipsterWeb.ComradeController do
  alias Multipster.Comrade
  alias Multipster.Repo
  use MultipsterWeb, :controller

  def index(conn, _params) do
    comrades = Repo.all(Comrade)
    render(conn, "index.html", comrades: comrades)
  end
end
