defmodule Rocketpay.User do
  # Define um esquema,.é usado para mapear qualquer fonte de dados em uma estrutura Elixir.
  use Ecto.Schema

  # Os conjuntos de alterações permitem filtrar, lançar, validar e definir restrições ao manipular estruturas.
  import Ecto.Changeset

  alias Ecto.Changeset
  alias Rocketpay.Account

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [
    :name,
    :age,
    :email,
    :password,
    :nickname
  ]

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :nickname, :string

    # Indica uma associação um para um com outro esquema.
    has_one :account, Account

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    # |> cast(params, [:name, ...])
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..130)
    |> validate_length(:password, min: 5)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Schema.html#summary
# https://hexdocs.pm/ecto/3.5.8/Ecto.Changeset.html#summary
# https://hexdocs.pm/bcrypt_elixir/Bcrypt.html#summary
