defmodule Rocketpay.User do
  # Define um esquema,.é usado para mapear qualquer fonte de dados em uma estrutura Elixir.
  use Ecto.Schema

  # Os conjuntos de alterações permitem filtrar, lançar, validar e definir restrições ao manipular estruturas.
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [
    :name,
    :age,
    :email,
    :password_hash,
    :nickname
  ]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password_hash, :string
    field :nickname, :string
  end

  def changeset(params) do
    %__MODULE__{}
    # |> cast(params, [:name, ...])
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..130)
    |> validate_length(:password_hash, min: 5)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
  end
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Schema.html#summary
# https://hexdocs.pm/ecto/3.5.8/Ecto.Changeset.html#summary
