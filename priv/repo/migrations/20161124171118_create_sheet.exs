defmodule Teambuilder.Repo.Migrations.CreateSheet do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :name, :string
      add :description, :string
      add :start_date, :datetime
      add :end_date, :datetime

      timestamps()
    end

  end
end
