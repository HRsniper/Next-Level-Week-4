$ = shell/cli

$ mix phx.new rocketpay --no-webpack --no-html

configurar banco de dados em config/dev.exs:
<!-- $ mix ecto.create -->
Alias definido em mix.exs
$ mix ecto.setup

config para o credo
$ mix credo gen.config

inicie seu aplicativo Phoenix:
$ mix phx.server

executar seu aplicativo dentro do IEx (Interactive Elixir):
$ iex -S mix phx.server

http://localhost:4000/dashboard
