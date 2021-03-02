defmodule Rocketpay do
  @moduledoc """
  Rocketpay mantém os contextos que definem seu domínio e lógica de negócios.

  Os contextos também são responsáveis por gerenciar seus dados, independentemente
  se vier do banco de dados, uma API externa ou outros.
  """

  alias Rocketpay.Users.Create, as: UserCreate

  alias Rocketpay.Accounts.{Deposit, Transaction, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call

  defdelegate transaction(params), to: Transaction, as: :call
end
