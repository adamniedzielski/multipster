defmodule MultipsterWeb.ComradeController do
  alias Multipster.Repo
  use MultipsterWeb, :controller

  def index(conn, _params) do
    comrades =
      conn.assigns[:current_user]
      |> Repo.preload(:comrades)
      |> Map.fetch!(:comrades)
    render(conn, "index.html", comrades: comrades)
  end
end
