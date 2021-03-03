defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def deposit(connection, params) do
    # caso erro with joga o ero para FallbackController
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      # user = RocketpayWeb.Guardian.Plug.current_resource(connection)
      # IO.puts(user.id)

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
    # task = Task.async(fn -> Rocketpay.transaction(params) end)
    # result = Task.await(task)

    # enquanto isso podemos faze outras tarefas/buscas no banco
    # a task , vai ser rodada  em outra thread junto com qual outa tarefa

    # with {:ok, %TransactionResponse{} = transaction} <- Task.await(task) do

    with {:ok, %TransactionResponse{} = transaction} <- Rocketpay.transaction(params) do
      connection
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end

    # Inicia uma tarefa. retorna nada
    # Task.start(fn -> Rocketpay.transaction(params) end)

    # connection
    # |> put_status(:no_content)
    # |> text("")
  end
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
# https://hexdocs.pm/elixir/Task.html#summary
