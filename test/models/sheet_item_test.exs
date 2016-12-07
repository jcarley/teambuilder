defmodule Teambuilder.SheetItemTest do
  use Teambuilder.ModelCase

  alias Teambuilder.SheetItem

  @valid_attrs %{description: "some content", meta: %{"item" => "some content"}, owner: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SheetItem.changeset(%SheetItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SheetItem.changeset(%SheetItem{}, @invalid_attrs)
    refute changeset.valid?
  end

  describe "vote count" do

    test "adds: when vote count doesn't exist" do
      sheet_item = %SheetItem{meta: %{"item" => "Pizza", "name" => "Jefferson"}}

      params = %{meta: %{"vote_count" => "1"}}
      changeset = SheetItem.voteup_changeset(sheet_item, params)

      assert changeset.valid?
      assert changeset.changes === %{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "1"}}
    end

    test "adds: when vote count exists" do
      sheet_item = %SheetItem{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "1"}}

      params = %{meta: %{"vote_count" => "1"}}
      changeset = SheetItem.voteup_changeset(sheet_item, params)

      assert changeset.valid?
      assert changeset.changes === %{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "2"}}
    end

    test "removes: when vote count doesn't exist" do
      sheet_item = %SheetItem{meta: %{"item" => "Pizza", "name" => "Jefferson"}}

      params = %{meta: %{"vote_count" => "-1"}}
      changeset = SheetItem.voteup_changeset(sheet_item, params)

      assert changeset.valid?
      assert changeset.changes === %{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "-1"}}
    end

    test "removes: when vote count exists" do
      sheet_item = %SheetItem{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "1"}}

      params = %{meta: %{"vote_count" => "-1"}}
      changeset = SheetItem.voteup_changeset(sheet_item, params)

      assert changeset.valid?
      assert changeset.changes === %{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "0"}}
    end

    test "sets: when vote count doesn't exist and vote count not a param" do
      sheet_item = %SheetItem{meta: %{"item" => "Pizza", "name" => "Jefferson"}}

      params = %{meta: %{}}
      changeset = SheetItem.voteup_changeset(sheet_item, params)

      assert changeset.valid?
      assert changeset.changes === %{meta: %{"item" => "Pizza", "name" => "Jefferson", "vote_count" => "0"}}
    end

  end
end
