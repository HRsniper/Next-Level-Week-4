defmodule RocketpayWeb.SessionController do
  use RocketpayWeb, :controller

  alias Rocketpay.User
  alias Rocketpay.Users.SignIn
  alias RocketpayWeb.Guardian

  # Registra o plug a ser chamado como um fallback para a ação do controlador.
  action_fallback RocketpayWeb.FallbackController

  def create(connection, %{"email" => email, "password" => password}) do
    # caso erro with joga o erro para FallbackController
    with {:ok, %User{} = user} <- SignIn.run(email, password) do
      {:ok, token, _claims} = Guardian.encode_and_sign(user)

      connection
      |> put_status(:ok)
      # para coloca token no header
      # |> put_resp_header(:jwt_token, token) |> render("session.json", user: user)
      |> render("session.json", user: user, token: token)
    end
  end
end

# https://hexdocs.pm/phoenix/Phoenix.Controller.html#summary
# https://hexdocs.pm/elixir/Task.html#summary
