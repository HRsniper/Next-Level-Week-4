defmodule Rocketpay.User do
  # Define um esquema,.é usado para mapear qualquer fonte de dados em uma estrutura Elixir.
  use Ecto.Schema
  # Os conjuntos de alterações permitem filtrar, lançar, validar e definir restrições ao manipular estruturas.
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Schema.html#summary
# https://hexdocs.pm/ecto/3.5.8/Ecto.Changeset.html#summary
