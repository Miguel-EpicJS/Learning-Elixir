defmodule JsonApiWeb.ClientController do
  use JsonApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def edit(conn, %{"id" => id}) do
    render(conn, "edit.html", id: id)
  end
  def new(conn, _params) do
    render(conn, "new.html")
  end
  def show(conn,  %{"id" => id}) do
    render(conn, "show.html", id: id)
  end
  def create(conn, _params) do
    render(conn, "create.html")
  end
  def update(conn, _params) do
    render(conn, "update.html")
  end
  def delete(conn, _params) do
    render(conn, "delete.html")
  end
end
