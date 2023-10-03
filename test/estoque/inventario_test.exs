defmodule Estoque.InventarioTest do
  use Estoque.DataCase

  alias Estoque.Inventario

  describe "produtos" do
    alias Estoque.Inventario.Produto

    import Estoque.InventarioFixtures

    @invalid_attrs %{nome: nil, preco: nil}

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Inventario.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Inventario.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      valid_attrs = %{nome: "some nome", preco: 120.5}

      assert {:ok, %Produto{} = produto} = Inventario.create_produto(valid_attrs)
      assert produto.nome == "some nome"
      assert produto.preco == 120.5
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventario.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      update_attrs = %{nome: "some updated nome", preco: 456.7}

      assert {:ok, %Produto{} = produto} = Inventario.update_produto(produto, update_attrs)
      assert produto.nome == "some updated nome"
      assert produto.preco == 456.7
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventario.update_produto(produto, @invalid_attrs)
      assert produto == Inventario.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Inventario.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Inventario.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Inventario.change_produto(produto)
    end
  end
end
