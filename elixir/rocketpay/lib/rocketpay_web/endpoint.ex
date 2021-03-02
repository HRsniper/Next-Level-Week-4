defmodule RocketpayWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :rocketpay

  # A sessão será armazenada no cookie e assinada,
  # isso significa que seu conteúdo pode ser lido, mas não adulterado.
  # Defina :encryption_salt se você também quiser criptografá-lo.
  @session_options [
    store: :cookie,
    key: "_rocketpay_key",
    signing_salt: "Pw/L6HJu"
  ]

  socket "/socket", RocketpayWeb.UserSocket,
    websocket: true,
    longpoll: false

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  # ´at: "/"´ Serve os arquivos estáticos do diretório "priv/static".
  # Você deve definir gzip como true se estiver executando phx.digest
  # ao implantar seus arquivos estáticos na produção.
  plug Plug.Static,
    at: "/",
    from: :rocketpay,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # O recarregamento do código pode ser explicitamente ativado no
  # configuração :code_reloader de seu endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :rocketpay
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug RocketpayWeb.Router
end
