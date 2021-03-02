defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  # change/0 descobrirá automaticamente se vai executar up/0 ou down/0
  def change do

    # criando tabala
    create table :users do
      # adicionando colunas
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      # inserted_at/updated_at
      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end

# https://hexdocs.pm/ecto_sql/Ecto.Migration.html#summary
# https://hexdocs.pm/ecto/3.5.8/Ecto.html#content
