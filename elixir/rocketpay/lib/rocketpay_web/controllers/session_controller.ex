defmodule RocketpayWeb.SessionController do
  use RocketpayWeb, :controller

  alias Rocketpay.User
  alias Rocketpay.Users.SignIn

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def create(connection, %{"email" => email, "password" => password}) do
    # caso erro with joga o erro para FallbackController
    with {:ok, %User{} = user} <- SignIn.run(email, password) do
      connection
      |> put_status(:ok)
      |> render("session.json", user: user)
    end
  end
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
# https://hexdocs.pm/elixir/Task.html#summary
