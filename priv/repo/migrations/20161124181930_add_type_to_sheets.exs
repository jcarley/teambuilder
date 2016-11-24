defmodule Teambuilder.Repo.Migrations.AddTypeToSheets do
  use Ecto.Migration

  def change do
    alter table(:sheets) do
      add :type, :string
    end
  end
end
