defmodule RocketpayWeb.FallbackController do
  use RocketpayWeb, :controller

  def call(connection, {:error, result}) do
    # IO.puts("passando pelo fallback")
    connection
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
