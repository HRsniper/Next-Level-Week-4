defmodule RocketpayWeb.SessionView do
  use RocketpayWeb, :view

  alias Rocketpay.{Account, User}

  def render("session.json", %{user: user}) do
    # retorno
    %{
      message: "Authenticated",
      email: user.email,
      password: user.password_hash
    }
  end
end
