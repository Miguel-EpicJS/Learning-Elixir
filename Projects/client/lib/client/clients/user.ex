defmodule Client.Clients.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :desc, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :price, :desc])
    |> validate_required([:name, :price, :desc])
  end
end
