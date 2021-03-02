use Mix.Config

# Para produção, não se esqueça de configurar o host url
# para algo significativo, Phoenix usa esta informação
# ao gerar URLs.
#
# Nota também incluir o caminho para um cache manifesto
# Contendo a versão digerida de arquivos estáticos. Isto
# manifesto é gerado pela tarefa `mix phx.digest`, tasks
# que você deve executar após os arquivos estáticos serem construídos e
# antes de iniciar seu servidor de produção.
config :rocketpay, RocketpayWeb.Endpoint,
  url: [host: "rocketpay.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Não imprimir mensagens de depuração na produção
config :logger, level: :info

# ## SSL Suportado
#
# Para começar a trabalhar SSL, você precisará adicionar a chave `https`
# para a seção anterior e defina sua porta `url:` para 443:
#     config :rocketpay, RocketpayWeb.Endpoint,
#       ...
#       url: [host: "rocketpay.com", port: 443],
#       https: [
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#         transport_options: [socket_opts: [:inet6]]
#       ]
#
# O `cipher_suite:` é definido como `:strong` para suportar apenas o
# cifras SSL mais recentes e seguras. Isso significa navegadores antigos
# e os clientes podem não ser suportados. Você pode configurá-lo para
# `:compatible` para um suporte mais amplo.
#
#`keyfile:` e`certfile:` esperam um caminho absoluto para a chave
# e cert em disco ou um caminho relativo dentro de priv, para rocketpay
# "priv/ssl/server.key". Para todas as configurações SSL suportadas
# opções, consulte https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# Também recomendamos definir `force_ssl` em seu endpoint, garantindo
# nenhum dado é enviado via http, sempre redirecionando para https:
#     config :rocketpay, RocketpayWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Verifique `Plug.SSL` para todas as opções disponíveis em` force_ssl`.

# Finalmente importe o config/prod.secret.exs que carrega os segredos
# e configuração de variáveis de ambiente.
import_config "prod.secret.exs"
