defmodule Teambuilder.SheetControllerTest do
  use Teambuilder.ConnCase

  alias Teambuilder.Sheet
  @valid_attrs %{description: "some content", end_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, name: "some content", start_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sheet_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sheets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sheet_path(conn, :new)
    assert html_response(conn, 200) =~ "New sheet"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sheet_path(conn, :create), sheet: @valid_attrs
    assert redirected_to(conn) == sheet_path(conn, :index)
    assert Repo.get_by(Sheet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sheet_path(conn, :create), sheet: @invalid_attrs
    assert html_response(conn, 200) =~ "New sheet"
  end

  test "shows chosen resource", %{conn: conn} do
    sheet = Repo.insert! %Sheet{}
    conn = get conn, sheet_path(conn, :show, sheet)
    assert html_response(conn, 200) =~ "Show sheet"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sheet_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sheet = Repo.insert! %Sheet{}
    conn = get conn, sheet_path(conn, :edit, sheet)
    assert html_response(conn, 200) =~ "Edit sheet"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sheet = Repo.insert! %Sheet{}
    conn = put conn, sheet_path(conn, :update, sheet), sheet: @valid_attrs
    assert redirected_to(conn) == sheet_path(conn, :show, sheet)
    assert Repo.get_by(Sheet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sheet = Repo.insert! %Sheet{}
    conn = put conn, sheet_path(conn, :update, sheet), sheet: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sheet"
  end

  test "deletes chosen resource", %{conn: conn} do
    sheet = Repo.insert! %Sheet{}
    conn = delete conn, sheet_path(conn, :delete, sheet)
    assert redirected_to(conn) == sheet_path(conn, :index)
    refute Repo.get(Sheet, sheet.id)
  end
end
