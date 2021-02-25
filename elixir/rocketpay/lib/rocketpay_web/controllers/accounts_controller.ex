defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transaction

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def deposit(connection, params) do
    # caso erro with joga o ero para FallbackController
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(connection, params) do
    with {:ok, %Account{} = account} <- Rocketpay.withdraw(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(connection, params) do
    with {:ok, %{} = transaction} <- Rocketpay.transaction(params) do
      connection
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
