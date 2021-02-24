defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def create(connection, params) do
    params
    |> Rocketpay.create_user()
    |> handle_response(connection)
  end

  defp handle_response({:ok, %User{} = user}, connection) do
    connection
    |> put_status(:created)
    # |> json(%{message: "User #{user}"})
    # users_view.ex
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _result} = error, _connection), do: error
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
