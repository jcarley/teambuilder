defmodule Teambuilder.Repo.Migrations.AddTeamIdToSheet do
  use Ecto.Migration

  def change do
    alter table(:sheets) do
      add :team_id, references(:teams, on_delete: :nothing)
    end
    create index(:sheets, [:team_id])
  end
end
