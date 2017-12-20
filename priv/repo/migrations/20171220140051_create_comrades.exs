defmodule Multipster.Repo.Migrations.CreateComrades do
  use Ecto.Migration

  def change do
    create table(:comrades) do
      add :name, :string, null: false
      add :context, :string

      timestamps()
    end

  end
end
