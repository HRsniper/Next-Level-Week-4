defmodule Rocketpay.Users.SignIn do
  alias Ecto.Multi
  alias Rocketpay.{Account, Repo, User}

  def run(email, password) do
    case Repo.get_by(User, email: email) do
      %User{} = user -> verify_password(user, password)
      # Unauthorized se nao achar o email
      nil -> {:error, :unauthorized}
    end
  end

  defp verify_password(user, password) do
    if Pbkdf2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      # Unauthorized se a senha nao bater
      {:error, :unauthorized}
    end
  end
end
