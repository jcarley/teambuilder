defmodule Teambuilder.SheetTest do
  use Teambuilder.ModelCase

  alias Teambuilder.Sheet

  @valid_attrs %{description: "some content", end_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, name: "some content", start_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sheet.changeset(%Sheet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sheet.changeset(%Sheet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
