defmodule Multipster.Repo.Migrations.AddUserToComrade do
  use Ecto.Migration

  def change do
    alter table(:comrades) do
      add :user_id, references(:users), null: false
    end
    create index(:comrades, [:user_id])
  end
end
