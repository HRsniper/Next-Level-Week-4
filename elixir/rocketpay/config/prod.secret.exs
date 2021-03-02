# Neste arquivo, carregamos a configuração de produção e os segredos
# de variáveis de ambiente. Você também pode codificar segredos,
# embora isso geralmente não seja recomendado e você tenha que
# lembre-se de adicionar este arquivo ao seu .gitignore.

use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :rocketpay, Rocketpay.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :rocketpay, RocketpayWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# Se você estiver fazendo lançamentos OTP, você precisa instruir o Phoenix
# para iniciar cada endpoint relevante:
#     config :rocketpay, RocketpayWeb.Endpoint, server: true
#
# Então você pode montar uma versão chamando `mix release`.
# Veja `mix help release` para mais informações.
