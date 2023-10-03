defmodule Estoque.Repo do
  use Ecto.Repo,
    otp_app: :estoque,
    adapter: Ecto.Adapters.Postgres
end
