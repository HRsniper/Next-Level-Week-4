defmodule Rocketpay.Users.List do
  alias Rocketpay.{Account, Repo, User}

  def call() do
    Repo.all(User)
  end
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Multi.html#summary
