defmodule EstoqueWeb.ProdutoController do
  use EstoqueWeb, :controller

  alias Estoque.Inventario
  alias Estoque.Inventario.Produto

  def index(conn, _params) do
    produtos = Inventario.list_produtos()
    render(conn, "index.html", produtos: produtos)
  end

  def new(conn, _params) do
    changeset = Inventario.change_produto(%Produto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"produto" => produto_params}) do
    case Inventario.create_produto(produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto created successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Inventario.get_produto!(id)
    render(conn, "show.html", produto: produto)
  end

  def edit(conn, %{"id" => id}) do
    produto = Inventario.get_produto!(id)
    changeset = Inventario.change_produto(produto)
    render(conn, "edit.html", produto: produto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Inventario.get_produto!(id)

    case Inventario.update_produto(produto, produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto updated successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", produto: produto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Inventario.get_produto!(id)
    {:ok, _produto} = Inventario.delete_produto(produto)

    conn
    |> put_flash(:info, "Produto deleted successfully.")
    |> redirect(to: Routes.produto_path(conn, :index))
  end
end
