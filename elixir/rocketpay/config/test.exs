use Mix.Config

# Configura o banco de dados
#
# A variável de ambiente MIX_TEST_PARTITION pode ser usada
# para fornecer particionamento de teste integrado no ambiente de CI.
# Execute `mix help test` para mais informações.

config :rocketpay, Rocketpay.Repo,
  username: "postgres",
  password: "postgres",
  database: "rocketpay_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Não rodamos um servidor durante o teste. Se for necessário,
# você pode habilitar a opção de servidor abaixo.
config :rocketpay, RocketpayWeb.Endpoint,
  http: [port: 4002],
  server: false

# Imprime apenas avisos e erros durante o teste
config :logger, level: :warn
