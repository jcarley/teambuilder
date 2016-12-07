defmodule Teambuilder.VoteupController do
  use Teambuilder.Web, :controller

  alias Teambuilder.Team
  alias Teambuilder.Sheet
  alias Teambuilder.SheetItem

  def create(conn, %{"team_id" => team_id, "sheet_id" => sheet_id, "sheet_item" => sheet_item_params}) do

    query = from s in Sheet,
            where: s.id == ^sheet_id and s.team_id == ^team_id

    sheet = Repo.one!(query)
    result = Ecto.build_assoc(sheet, :items, meta: sheet_item_params)
             |> Repo.insert

    case result do
      {:ok, _sheet_item} ->
        conn
        |> put_flash(:info, "Sheet Item created successfully.")
        |> redirect(to: team_sheet_path(conn, :show, team_id, sheet))
      {:error, _} ->
        conn
        |> put_flash(:info, "Sheet Item created failed.")
        |> redirect(to: team_sheet_path(conn, :show, team_id, sheet))
    end
  end

  def update(conn, %{"team_id" => team_id, "sheet_id" => sheet_id, "id" => id, "sheet_item" => sheet_item_params}) do

    sheet_item = Repo.get!(SheetItem, id)
    changeset = SheetItem.voteup_changeset(sheet_item, %{meta: sheet_item_params})

    case Repo.update(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Sheet Item updated successfully.")
        |> redirect(to: team_sheet_path(conn, :show, team_id, sheet_id))
      {:error, _} ->
        conn
        |> put_flash(:info, "Sheet Item updated failed.")
        |> redirect(to: team_sheet_path(conn, :show, team_id, sheet_id))
    end
  end

end
