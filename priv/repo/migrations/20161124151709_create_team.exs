defmodule Teambuilder.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
