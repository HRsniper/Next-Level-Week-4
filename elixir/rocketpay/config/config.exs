# Este arquivo é responsável por configurar seu aplicativo
# e suas dependências com o auxílio do módulo Mix.Config.
#
# Este arquivo de configuração é carregado antes de qualquer dependência e
# está restrito a este projeto.

# Configuração geral do aplicativo
use Mix.Config

config :rocketpay,
  ecto_repos: [Rocketpay.Repo]

# Configura o endpoint
config :rocketpay, RocketpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p2NnHbcHKwGA8U+/HrFb/K8Z4gcTH9shpnEmU7F40uG3Dwd+OcBijIGHvJNwU2g1",
  render_errors: [view: RocketpayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocketpay.PubSub,
  live_view: [signing_salt: "2Ws6HRhq"]

# Configurar para usar UUID
config :rocketpay, Rocketpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configurar autenticação
config :rocketpay, :basic_auth,
  username: "hercules",
  password: "elixir"

# Configura o Logger do Elixir
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configura para usar Jason para análise JSON em Phoenix
config :phoenix, :json_library, Jason

# Importar configuração específica do ambiente. Isso deve permanecer na parte inferior
# deste arquivo, portanto, substitui a configuração definida acima.
import_config "#{Mix.env()}.exs"
