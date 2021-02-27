defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    # Define um retorno de chamada a ser executado antes de cada teste em um caso.
    setup %{conn: connection} do
      params = %{
        name: "rafael",
        password: "elixir",
        nickname: "rafaelixir",
        email: "email@email.com",
        age: 27
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      connection = put_req_header(connection, "authorization", "Basic aGVyY3VsZXM6ZWxpeGly")

      {:ok, conn: connection, account_id: account_id}
    end

    test "when all params are valid, make deposit", %{
      conn: connection,
      account_id: account_id
    } do
      params = %{"value" => "50.00"}

      response =
        connection
        |> post(Routes.accounts_path(connection, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end

    test "when are invalid params, returns an deposit error", %{
      conn: connection,
      account_id: account_id
    } do
      params = %{"value" => "not_value"}

      response =
        connection
        |> post(Routes.accounts_path(connection, :deposit, account_id, params))
        # |> json_response(400)
        |> json_response(:bad_request)

      # assert %{"message" => "Invalid operation"} = response
      expected_response = %{"message" => "Invalid operation"}
      assert response == expected_response
    end
  end
end

# https://hexdocs.pm/ex_unit/ExUnit.Callbacks.html#setup/1
# https://hexdocs.pm/phoenix/Phoenix.ConnTest.html#summary
