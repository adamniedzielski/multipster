defmodule Multipster.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :citext, null: false

      timestamps()
    end

    create index(:users, [:email], unique: true)
  end
end
