defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :balance, :decimal
      # Define uma chave estrangeira.
      add :use_id, references(:users, type: :binary_id)

      timestamps()
    end

    # uma restrição de verificação ou uma restrição de exclusão
    create constraint(:accounts, :balance_must_be_positive_or_zero, check: "balance >= 0")
  end
end

# https://hexdocs.pm/ecto_sql/Ecto.Migration.html#summary
