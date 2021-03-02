defmodule RocketpayWeb.ConnCase do
  @moduledoc """
  Este módulo define o caso de teste a ser usado por
  testes que requerem a configuração de uma conexão.

  Esses testes contam com `Phoenix.ConnTest` e também
  importe outra funcionalidade para torná-lo mais fácil
  para construir estruturas de dados comuns e consultar a camada de dados.

  Finalmente, se o caso de teste interagir com o banco de dados,
  habilitamos a sandbox SQL, portanto, as alterações feitas no banco de dados
  são revertidos no final de cada teste. Se você estiver usando
  PostgreSQL, você pode até mesmo executar testes de banco de dados de forma assíncrona
  definindo `use RocketpayWeb.ConnCase, async: true`, embora
  esta opção não é recomendada para outros bancos de dados.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import RocketpayWeb.ConnCase

      alias RocketpayWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint RocketpayWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rocketpay.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Rocketpay.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
