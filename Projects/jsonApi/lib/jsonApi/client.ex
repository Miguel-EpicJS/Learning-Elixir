defmodule JsonApi.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :address, :string
    field :desc, :string
    field :name, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :price, :address, :desc])
    |> validate_required([:name, :price, :address])
    |> validate_length(:name, min: 3)
    |> validate_length(:name, max: 250)
    |> validate_length(:address, max: 250)
    |> validate_length(:desc, max: 250)
  end
end
