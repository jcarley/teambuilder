defmodule Teambuilder.Repo.Migrations.CreateSheetItem do
  use Ecto.Migration

  def change do
    create table(:sheetitems) do
      add :description, :string
      add :meta, :string
      add :type, :string
      add :owner, :string

      timestamps()
    end

  end
end
