defmodule RocketpayWeb.SessionView do
  use RocketpayWeb, :view

  alias Rocketpay.{Account, User}

  def render("session.json", %{user: %User{email: email, password_hash: password}}) do
    # retorno
    %{
      message: "Authenticated",
      email: email,
      password: password
    }
  end
end
