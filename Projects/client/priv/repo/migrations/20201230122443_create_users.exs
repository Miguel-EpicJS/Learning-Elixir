defmodule Client.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :price, :float
      add :desc, :string

      timestamps()
    end

  end
end
