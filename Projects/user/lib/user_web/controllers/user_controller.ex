defmodule UserWeb.UserController do
  use UserWeb, :controller
  alias User.{Repo, User}

  def index(conn, _params) do
    render(conn, "index.html")
  end
  def edit(conn, %{"id" => id}) do
    id = String.to_integer(id)
    changeset = User.changeset(%User{})
    render(conn, "edit.html", changeset: changeset, id: id)
  end
  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end
  def show(conn, %{"id" => id}) do
    id = String.to_integer(id)
    render(conn, "show.html", id: id)
  end
  def create(conn, params) do
    changeset = User.changeset(%User{}, params["user"])
    if changeset.valid? do
      Repo.insert(%User{name: changeset.changes.name, email: changeset.changes.email})
    end
    render(conn, "index.html")
  end
  def update(conn, params) do
    user = Enum.at(Repo.all(User), String.to_integer(params["id"]))
    charset = User.changeset(user, %{name: params["user"]["name"], email: params["user"]["email"] })
    Repo.update(charset)
    render(conn, "index.html")
  end
  def delete(conn, _params) do
    IO.puts(conn)
  end
end
