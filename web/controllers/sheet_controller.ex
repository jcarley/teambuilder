defmodule Teambuilder.SheetController do
  use Teambuilder.Web, :controller

  alias Teambuilder.Team
  alias Teambuilder.Sheet

  def index(conn, %{"team_id" => team_id}) do

    team = Repo.get!(Team, team_id)
    query = from s in Sheet,
            where: s.team_id == ^team_id

    sheets = query
             |> Repo.all
    render(conn, "index.html", team: team, sheets: sheets)
  end

  def new(conn, %{"team_id" => team_id}) do
    team = Repo.get!(Team, team_id)
    changeset = Sheet.changeset(%Sheet{})
    render(conn, "new.html", team: team, changeset: changeset)
  end

  def create(conn, %{"team_id" => team_id, "sheet" => sheet_params}) do

    sheet_params = Map.put(sheet_params, "team_id", team_id)
    changeset = Sheet.changeset(%Sheet{}, sheet_params)

    case Repo.insert(changeset) do
      {:ok, _sheet} ->
        conn
        |> put_flash(:info, "Sheet created successfully.")
        |> redirect(to: team_sheet_path(conn, :index, team_id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"team_id" => team_id, "id" => id}) do
    team = Repo.get!(Team, team_id)
    sheet = Repo.get!(Sheet, id)
    sheet = Repo.preload(sheet, :items)
    render(conn, "#{sheet.type}.html", team: team, sheet: sheet)
  end

  def edit(conn, %{"team_id" => team_id, "id" => id}) do
    team = Repo.get!(Team, team_id)
    sheet = Repo.get!(Sheet, id)
    changeset = Sheet.changeset(sheet)
    render(conn, "edit.html", team: team, sheet: sheet, changeset: changeset)
  end

  def update(conn, %{"team_id" => team_id, "id" => id, "sheet" => sheet_params}) do

    team = Repo.get!(Team, team_id)
    sheet = Repo.get!(Sheet, id)
    changeset = Sheet.changeset(sheet, sheet_params)

    case Repo.update(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Sheet updated successfully.")
        |> redirect(to: team_sheet_path(conn, :index, team))
      {:error, _} ->
        render(conn, "edit.html", sheet: sheet)
    end
  end

  def delete(conn, %{"id" => id}) do
    # sheet = Repo.get!(Sheet, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    # Repo.delete!(sheet)

    # conn
    # |> put_flash(:info, "Sheet deleted successfully.")
    # |> redirect(to: sheet_path(conn, :index))
  end
end
