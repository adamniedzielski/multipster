defmodule Multipster.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Multipster.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import MultipsterWeb.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Multipster.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Multipster.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Multipster.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
