defmodule JsonApi.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :price, :float
      add :address, :string
      add :desc, :string

      timestamps()
    end

  end
end
