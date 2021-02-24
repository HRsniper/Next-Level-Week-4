defmodule Rocketpay.Account do
  # Define um esquema,.é usado para mapear qualquer fonte de dados em uma estrutura Elixir.
  use Ecto.Schema

  # Os conjuntos de alterações permitem filtrar, lançar, validar e definir restrições ao manipular estruturas.
  import Ecto.Changeset

  # alias Ecto.Changeset
  alias Rocketpay.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [
    :balance,
    :user_id
  ]

  schema "users" do
    field :balance, :decimal
    # Indica uma associação um para um ou muitos para um com outro esquema
    belongs_to :user, User

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    # Verifica se há uma restrição de verificação no campo fornecido.
    |> check_constraint(:balance, :balance_must_be_positive_or_zero)
  end
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Schema.html#summary
# https://hexdocs.pm/ecto/3.5.8/Ecto.Changeset.html#summary
