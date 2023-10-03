defmodule Estoque.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :preco, :float

      timestamps()
    end
  end
end
