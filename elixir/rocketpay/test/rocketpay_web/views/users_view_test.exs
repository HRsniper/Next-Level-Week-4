defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  # Traz render/3 e render_to_string/3 para testar visualizações personalizadas
  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "rafael",
      password: "elixir",
      nickname: "rafaelixir",
      email: "email@email.com",
      age: 27
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "rafael",
        nickname: "rafaelixir"
      }
    }

    assert expected_response == response
  end
end
