defmodule Teambuilder.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :string
      add :start_date, :datetime
      add :end_date, :datetime

      timestamps()
    end

  end
end
