defmodule RocketpayWeb do
  @moduledoc """
  O ponto de entrada para definir sua interface da web, como
  como controladores, visualizações, canais e assim por diante.
  Isso pode ser usado em seu aplicativo como:
      use RocketpayWeb, :controller
      use RocketpayWeb, :view
      use RocketpayWeb, :channel

  As definições abaixo serão executadas para cada visão,
  controlador, etc..., então mantenha-os curtos e claros, focados
  sobre importações, usos e apelidos.

  NÃO defina funções dentro das expressões entre aspas abaixo.
  Em vez disso, defina qualquer função auxiliar nos módulos
  e importe esses módulos aqui.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: RocketpayWeb

      import Plug.Conn
      import RocketpayWeb.Gettext
      alias RocketpayWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/rocketpay_web/templates",
        namespace: RocketpayWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import RocketpayWeb.Gettext
    end
  end

  defp view_helpers do
    quote do
      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import RocketpayWeb.ErrorHelpers
      import RocketpayWeb.Gettext
      alias RocketpayWeb.Router.Helpers, as: Routes
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
