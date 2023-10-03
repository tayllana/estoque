defmodule Estoque.Inventario.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :nome, :string
    field :preco, :float

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :preco])
    |> validate_number(:preco, greater_than: 0)
    |> validate_required([:nome, :preco])
  end
end
