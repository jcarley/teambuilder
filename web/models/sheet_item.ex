defmodule Teambuilder.SheetItem do
  use Teambuilder.Web, :model

  schema "sheetitems" do
    field :description, :string
    field :meta, :map
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

  def voteup_changeset(struct, params \\ %{}) do
    vote_count = Map.get(params.meta, "vote_count", "0")

    merged_meta = struct.meta
                  |> Map.update("vote_count", vote_count, &(add_to_vote(&1, vote_count)))

    params = params
             |> Map.put(:meta, merged_meta)

    struct
    |> cast(params, [:description, :meta, :type, :owner])
    # |> validate_required([:description, :meta, :type, :owner])
  end

  defp add_to_vote(new, current) do
    new = parse_int(new)
    current = parse_int(current)
    new + current
    |> Integer.to_string
  end

  defp parse_int(value) do
    value
    |> Integer.parse(10)
    |> elem(0)
  end

end
