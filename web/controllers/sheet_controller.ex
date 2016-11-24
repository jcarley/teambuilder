defmodule Teambuilder.SheetController do
  use Teambuilder.Web, :controller

  alias Teambuilder.Sheet

  def index(conn, _params) do
    sheets = Repo.all(Sheet)
    render(conn, "index.html", sheets: sheets)
  end

  def new(conn, _params) do
    changeset = Sheet.changeset(%Sheet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sheet" => sheet_params}) do
    changeset = Sheet.changeset(%Sheet{}, sheet_params)

    case Repo.insert(changeset) do
      {:ok, _sheet} ->
        conn
        |> put_flash(:info, "Sheet created successfully.")
        |> redirect(to: sheet_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sheet = Repo.get!(Sheet, id)
    render(conn, "show.html", sheet: sheet)
  end

  def edit(conn, %{"id" => id}) do
    sheet = Repo.get!(Sheet, id)
    changeset = Sheet.changeset(sheet)
    render(conn, "edit.html", sheet: sheet, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sheet" => sheet_params}) do
    sheet = Repo.get!(Sheet, id)
    changeset = Sheet.changeset(sheet, sheet_params)

    case Repo.update(changeset) do
      {:ok, sheet} ->
        conn
        |> put_flash(:info, "Sheet updated successfully.")
        |> redirect(to: sheet_path(conn, :show, sheet))
      {:error, changeset} ->
        render(conn, "edit.html", sheet: sheet, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sheet = Repo.get!(Sheet, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sheet)

    conn
    |> put_flash(:info, "Sheet deleted successfully.")
    |> redirect(to: sheet_path(conn, :index))
  end
end
