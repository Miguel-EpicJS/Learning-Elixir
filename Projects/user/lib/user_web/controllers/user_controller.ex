defmodule UserWeb.UserController do
  use UserWeb, :controller
  alias User.User

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def edit(conn, _params) do
    render(conn, "edit.html")
  end
  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end
  def show(conn, %{"id" => id}) do
    id = String.to_integer(id)
    render(conn, "show.html", id: id)
  end
  def create(conn, _params) do
    render(conn, "index.html")
  end
  def update(conn, _params) do
    IO.puts(conn)
  end
  def delete(conn, _params) do
    IO.puts(conn)
  end
end
