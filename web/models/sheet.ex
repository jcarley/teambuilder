defmodule Teambuilder.Sheet do
  use Teambuilder.Web, :model

  schema "sheets" do
    field :name, :string
    field :description, :string
    field :type, :string
    field :start_date, Ecto.DateTime
    field :end_date, Ecto.DateTime
    has_many :items, Teambuilder.SheetItem

    timestamps()
  end

  @required_fields ~w(
    name
    type
    start_date
  )

  @optional_fields ~w(
    description
    end_date
  )

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(Enum.map(@required_fields, &(String.to_atom(&1))))
  end
end
