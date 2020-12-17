defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def show(conn, %{"messenger" => messeger}) do
    render(conn, "show.html", messeger: messeger)
  end
end
