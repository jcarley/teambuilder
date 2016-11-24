defmodule Teambuilder.SheetItemTest do
  use Teambuilder.ModelCase

  alias Teambuilder.SheetItem

  @valid_attrs %{description: "some content", meta: "some content", owner: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SheetItem.changeset(%SheetItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SheetItem.changeset(%SheetItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
