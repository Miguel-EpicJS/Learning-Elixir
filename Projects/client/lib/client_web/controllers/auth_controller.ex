defmodule ClientWeb.AuthController do
  use ClientWeb, :controller
  plug Ueberauth
  alias Client.Clients
  alias Client.Clients.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      provider: params["provider"]
    }

    changeset = Clients.change_user(%User{}, user_params)
    signin(conn, changeset)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.user_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "You have been signed in.")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in.")
        |> redirect(to: Routes.user_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Clients.get_user!(email: changeset.changes.email) do
      nil ->
        Clients.create_user(changeset.changes)

      user ->
        {:ok, user}
    end
  end
end
