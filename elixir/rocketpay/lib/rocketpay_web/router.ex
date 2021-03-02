defmodule RocketpayWeb.Router do
  use RocketpayWeb, :router

  import Plug.BasicAuth

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug :basic_auth, Application.compile_env(:rocketpay, :basic_auth)
  end

  scope "/api", RocketpayWeb do
    # pipe_through obedece as regras definidas no plug do pipeline
    pipe_through :api

    get "/:filename", WelcomeController, :index

    post "/users", UsersController, :create

    # post "/accounts/:id/deposit", AccountsController, :deposit
    # post "/accounts/:id/withdraw", AccountsController, :withdraw
    # post "/accounts/transaction", AccountsController, :transaction
  end

  scope "/api", RocketpayWeb do
    pipe_through [:api, :auth]

    post "/accounts/:id/deposit", AccountsController, :deposit
    post "/accounts/:id/withdraw", AccountsController, :withdraw
    post "/accounts/transaction", AccountsController, :transaction
  end

  # Habilita LiveDashboard apenas para desenvolvimento
  #
  # Se você deseja usar o LiveDashboard na produção, você deve colocar
  # por trás da autenticação e permitir que apenas administradores o acessem.
  # Se o seu aplicativo ainda não tiver uma seção exclusiva para administradores,
  # você pode usar Plug.BasicAuth para configurar alguma autenticação básica
  # contanto que você também esteja usando SSL (o que você deve fazer de qualquer maneira).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RocketpayWeb.Telemetry
    end
  end
end

# https://hexdocs.pm/plug/Plug.BasicAuth.html
# https://hexdocs.pm/phoenix/Phoenix.Router.html#summary
