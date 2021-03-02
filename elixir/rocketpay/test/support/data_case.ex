defmodule Rocketpay.DataCase do
  @moduledoc """
  Este módulo define a configuração para testes que requerem
  acesso à camada de dados do aplicativo.

  Você pode definir funções aqui para serem usadas como ajudantes em
  seus testes.

  Finalmente, se o caso de teste interagir com o banco de dados,
  habilitamos a sandbox SQL, portanto, as alterações feitas no banco de dados
  são revertidos no final de cada teste. Se você estiver usando
  PostgreSQL, você pode até mesmo executar testes de banco de dados de forma assíncrona
  definindo `use Rocketpay.DataCase, async: true`, embora
  esta opção não é recomendada para outros bancos de dados.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      alias Rocketpay.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Rocketpay.DataCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rocketpay.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Rocketpay.Repo, {:shared, self()})
    end

    :ok
  end

  @doc """
  A helper that transforms changeset errors into a map of messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
