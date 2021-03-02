defmodule Rocketpay.MixProject do
  use Mix.Project

  def project do
    [
      app: :rocketpay,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuração para o aplicativo OTP.
  # Digite `mix help compile.app` para mais informações.
  def application do
    [
      mod: {Rocketpay.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Especifica quais caminhos compilar por ambiente.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Especifica as dependências do seu projeto.
  # Digite `mix help deps` para exemplos e opções.
  defp deps do
    [
      {:phoenix, "~> 1.5.7"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      # {:bcrypt_elixir, "~> 2.0"},
      {:pbkdf2_elixir, "~> 1.3"},
      {:decimal, "~> 2.0"},
      {:excoveralls, "~> 0.14.0", only: [:test]}
    ]
  end

  # Aliases são atalhos ou tarefas específicas para o projeto atual.
  # Por exemplo, para instalar dependências do projeto e realizar outras tarefas de configuração, execute:
  # $ mix setup
  # Veja a documentação do `Mix` para mais informações sobre apelidos.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end

# https://hexdocs.pm/excoveralls/readme.html
