defmodule Trunkmonkey.PageController do
  use Trunkmonkey.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
