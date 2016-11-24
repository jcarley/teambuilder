defmodule Teambuilder.Event do
  use Teambuilder.Web, :model

  schema "events" do
    field :name, :string
    field :description, :string
    field :start_date, Ecto.DateTime
    field :end_date, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :start_date, :end_date])
    |> validate_required([:name, :description, :start_date, :end_date])
  end
end
