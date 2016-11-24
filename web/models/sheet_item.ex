defmodule Teambuilder.SheetItem do
  use Teambuilder.Web, :model

  schema "sheetitems" do
    field :description, :string
    field :meta, :string
    field :type, :string
    field :owner, :string
    belongs_to :sheet, Teambuilder.Sheet

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :meta, :type, :owner])
    |> validate_required([:description, :meta, :type, :owner])
  end
end
