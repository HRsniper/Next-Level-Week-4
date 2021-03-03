defmodule RocketpayWeb.AuthErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    # body = Jason.encode!(%{message: to_string(type)})
    body = Phoenix.json_library().encode!(%{message: to_string(type)})

    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(401, body)
  end
end
