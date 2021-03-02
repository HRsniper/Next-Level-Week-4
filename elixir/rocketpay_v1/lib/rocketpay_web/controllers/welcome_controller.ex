defmodule RocketpayWeb.WelcomeController do
  # definindo controller
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(connection, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(connection)
  end

  defp handle_response({:ok, %{result: result}}, connection) do
    connection
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here your number #{result}"})
  end

  defp handle_response({:error, reason}, connection) do
    connection
    |> put_status(:bad_request)
    |> json(reason)
  end
end
