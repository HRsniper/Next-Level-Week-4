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

http://localhost:4000/dashboard

executar seu aplicativo dentro do IEx (Interactive Elixir):
$ iex -S mix /ou/ iex -S mix phx.server

iex> Rocketpay.Numbers.sum_from_file("numbers")
{:ok, "1,2,3,4,8,9,10\n"}

http://localhost:4000/api/numbers
