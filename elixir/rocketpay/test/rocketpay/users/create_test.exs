defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "rafael",
        password: "elixir",
        nickname: "rafaelixir",
        email: "email@email.com",
        age: 27
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "rafael", age: 27, id: ^user_id} = user
    end

    test "when are invalid params, returns an fail" do
      params = %{
        name: "rafael",
        nickname: "rafaelixir",
        email: "email@email.com",
        age: 15
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{age: ["is invalid"], password: ["can't be blank"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
