defmodule ClientWeb.UserController do
  use ClientWeb, :controller

  alias Client.Clients
  alias Client.Clients.User

  def index(conn, _params) do
    users = Clients.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Clients.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Clients.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    try do
      user = Clients.get_user!(id)
      render(conn, "show.html", user: user)
    rescue
      e in Ecto.NoResultsError -> render(conn, "error.html", e: e)
    end
  end

  def edit(conn, %{"id" => id}) do
    user = Clients.get_user!(id)
    changeset = Clients.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Clients.get_user!(id)

    case Clients.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Clients.get_user!(id)
    {:ok, _user} = Clients.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
