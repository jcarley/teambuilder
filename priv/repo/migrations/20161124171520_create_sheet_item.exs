defmodule Teambuilder.Repo.Migrations.CreateSheetItem do
  use Ecto.Migration

  def change do
    create table(:sheetitems) do
      add :description, :string
      add :meta, :map
      add :type, :string
      add :owner, :string
      add :sheet_id, references(:sheets, on_delete: :nothing)

      timestamps()
    end
    create index(:sheetitems, [:sheet_id])

  end
end
