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
#focopraticagrupo
```

http://localhost:4000/api/users

retorna todos usuarios do banco
iex> Rocketpay.Repo.all(Rocketpay.User)

$ mix ecto.gen.migration create_accounts_table

$ mix ecto.migrate

$ Rocketpay.create_user(%{name: "hr", age: 23, email: "w@w.com", password: "123456", nickname: "qewqweqw"})

$  Rocketpay.deposit(%{"id" => "c0c85899-41be-4168-b652-28b27246cdca", "value" => "50.0"})

$ Rocketpay.withdraw(%{"id" => "c0c85899-41be-4168-b652-28b27246cdca", "value" => "50.0"})

$ Rocketpay.Accounts.Transaction.call(%{"from" => "c0c85899-41be-4168-b652-28b27246cdca", "to" => "8a45f802-7971-4d05-8a1f-f70fdb376fda", "value" => "100.0"})
