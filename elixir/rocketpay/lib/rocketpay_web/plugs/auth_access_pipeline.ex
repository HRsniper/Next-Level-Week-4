defmodule RocketpayWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :rocketpay

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  # Por padrão, o plug LoadResource retornará um erro se nenhum recurso for encontrado.
  # Você pode substituir esse comportamento usando a opção `allow_blank: true`.
  plug Guardian.Plug.LoadResource
end
