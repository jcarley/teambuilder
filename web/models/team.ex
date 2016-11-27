defmodule Teambuilder.Team do
  use Teambuilder.Web, :model

  schema "teams" do
    field :name, :string
    field :description, :string
    has_many :sheets, Teambuilder.Sheet, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
