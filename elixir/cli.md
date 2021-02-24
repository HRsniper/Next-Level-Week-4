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

$ mix test

Gera uma nova migração para o repositório
$ mix ecto.gen.migration create_user_table

Executa as migrações do repositório
$ mix ecto.migrate

Descarta o repositório
$ mix ecto.drop

$ mix ecto.create
$ mix ecto.migrate

iex> Rocketpay.User.changeset(%{ name: "Hercules", age: "23", email: "HR@gmail.com", password_hash: "hashed123", nickname: "HRsniper" })
<!-- #Ecto.Changeset<
  action: nil,
  changes: %{
    age: 23,
    email: "HR@gmail.com",
    name: "Hercules",
    nickname: "HRsniper",
    password_hash: "hashed123"
  },
  errors: [],
  data: #Rocketpay.User<>,
  valid?: true
> -->

```
#rumoaoproximonivel
#jornadainfinita
```

http://localhost:4000/api/users
