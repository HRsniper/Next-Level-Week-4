defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def create(connection, params) do
    # caso erro with joga o ero para FallbackController
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
