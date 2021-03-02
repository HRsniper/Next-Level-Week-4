defmodule RocketpayWeb.ErrorViewTest do
  use RocketpayWeb.ConnCase, async: true

  # Traga render/3 e render_to_string/3 para testar visualizações personalizadas
  import Phoenix.View

  test "renders 404.json" do
    assert render(RocketpayWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(RocketpayWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
