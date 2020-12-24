defmodule UserWeb.PageController do
  use UserWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
