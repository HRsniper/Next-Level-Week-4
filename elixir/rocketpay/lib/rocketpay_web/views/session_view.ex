defmodule RocketpayWeb.SessionView do
  use RocketpayWeb, :view

  alias Rocketpay.{Account, User}

  def render("session.json", %{}) do
    # retorno
    %{
      message: "Authenticated"
    }
  end
end
