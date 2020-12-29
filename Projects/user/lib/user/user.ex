defmodule User.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, params \\ %{}) do
    cast(user, params, [:name, :email])
  end
end
