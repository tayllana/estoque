defmodule EstoqueWeb.PageController do
  use EstoqueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
