defmodule RocketpayWeb.WelcomeController do
  # definindo controller
  use RocketpayWeb, :controller

  def index(connection,_params) do
    text(connection, "Welcome to the Rocketpay API")
  end
end
