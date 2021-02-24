defmodule Rocketpay.Users.Create do
  alias Ecto.Multi
  alias Rocketpay.{Account, Repo, User}

  def call(params) do
    # Retorna uma estrutura Ecto.Multi vazia
    Multi.new()
    # Adiciona uma operação de inserção ao multi.
    |> Multi.insert(:crate_user, User.changeset(params))
    # Adiciona uma função para ser executada como parte do multi.
    # A função deve retornar {:ok, value}ou {:error, value}
    |> Multi.run(:create_account, fn repo, %{create_user: user} ->
      insert_account(repo, user)
    end)
    |> Multi.run(:preload_data, fn repo, %{create_user: user} ->
      preload_data(repo, user)
    end)
    |> run_transation()

    # params
    # |> User.changeset()
    # |> Repo.insert()
  end

  defp insert_account(repo, user) do
    user.id
    |> account_changeset()
    |> repo.insert()
  end

  defp account_changeset(user_id) do
    params = %{user_id: user_id, balance: "0.00"}
    Account.changeset(params)
  end

  defp preload_data(repo, user) do
    {:ok, repo.preload(user, :account)}
  end

  defp run_transation(multi) do
    # transação retorna o valor como {:ok, value} ou {:error, value}.
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_data: user}} -> {:ok, user}
    end
  end
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Multi.html#summary
