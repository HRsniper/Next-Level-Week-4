defmodule RocketpayWeb.ErrorView do
  use RocketpayWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]
  alias Ecto.Changeset

  # Se você deseja personalizar um código de status específico
  # para um determinado formato, você pode descomentar abaixo.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # Por padrão, o Phoenix retorna a mensagem de status de
  # o nome do modelo. Por exemplo, "404.json" torna-se
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("400.json", %{result: %Changeset{} = changeset}) do
    %{message: translate_errors(changeset)}
  end

  def render("400.json", %{result: message}) do
    %{message: message}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end

# https://hexdocs.pm/ecto/3.5.8/Ecto.Changeset.html#summary
