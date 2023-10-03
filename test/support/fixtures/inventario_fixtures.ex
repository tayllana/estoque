defmodule Estoque.InventarioFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Estoque.Inventario` context.
  """

  @doc """
  Generate a produto.
  """
  def produto_fixture(attrs \\ %{}) do
    {:ok, produto} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        preco: 120.5
      })
      |> Estoque.Inventario.create_produto()

    produto
  end
end
