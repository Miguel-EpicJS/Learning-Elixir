defmodule UserWeb.UserController do
  use UserWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def edit(conn, _params) do
    render(conn, "edit.html")
  end
  def new(conn, _params) do
    render(conn, "new.html")
  end
  def show(conn, _params) do
    render(conn, "show.html")
  end
  def create(conn, _params) do
    IO.puts(conn)
  end
  def update(conn, _params) do
    IO.puts(conn)
  end
  def delete(conn, _params) do
    IO.puts(conn)
  end
end
