use Mix.Config

# Configura o banco de dados
config :rocketpay, Rocketpay.Repo,
  username: "postgres",
  password: "postgres",
  database: "rocketpay_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Para o desenvolvimento, desabilitamos qualquer cache e habilitamos
# depuração e recarregamento de código.
#
# A configuração dos observadores pode ser usada para executar funções externas
# observadores para seu aplicativo. Por exemplo, nós o usamos
# com webpack para recompilar fontes .js e .css.
config :rocketpay, RocketpayWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# ## SSL Suportado
#
# Para usar HTTPS no desenvolvimento, um certificado auto-assinado
# pode ser gerado executando o seguinte
# Mix task: `mix phx.gen.cert`
#
# Execute `mix help phx.gen.cert` para mais informações.
#
# A configuração `http:` acima pode ser substituída por:
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# Se desejado, ambas as chaves `http:` e `https:` podem ser
# configurado para executar servidores http e https em portas diferentes.

# Não inclua metadados nem carimbos de data/hora nos logs de desenvolvimento
config :logger, :console, format: "[$level] $message\n"

# Defina um rastreamento de pilha (stacktrace) mais alto durante o desenvolvimento.
# Evite configurar na produção, pois construir grandes rastreamentos de pilha (stacktraces) pode ser caro.
config :phoenix, :stacktrace_depth, 20

# Inicialize os plugs em tempo de execução (runtime) para uma compilação de desenvolvimento mais rápida
config :phoenix, :plug_init_mode, :runtime
