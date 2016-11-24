defmodule Teambuilder.PageController do
  use Teambuilder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
