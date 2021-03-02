defmodule Rocketpay.Application do
  # Veja https://hexdocs.pm/elixir/Application.html
  # para obter mais informações sobre aplicativos OTP
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Inicie o repositório Ecto
      Rocketpay.Repo,
      # Inicie o supervisor de telemetria
      RocketpayWeb.Telemetry,
      # Inicie o sistema PubSub
      {Phoenix.PubSub, name: Rocketpay.PubSub},
      # Inicie o Endpoint (http/https)
      RocketpayWeb.Endpoint
      # Inicie um trabalhador (worker) chamando: Rocketpay.Worker.start_link(arg)
      # {Rocketpay.Worker, arg}
    ]

    # Veja https://hexdocs.pm/elixir/Supervisor.html
    # para outras estratégias e opções com suporte
    opts = [strategy: :one_for_one, name: Rocketpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Diga ao Phoenix para atualizar a configuração do endpoint
  # sempre que o aplicativo for atualizado.
  def config_change(changed, _new, removed) do
    RocketpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
