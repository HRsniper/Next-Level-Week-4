defmodule RocketpayWeb.Gettext do
  @moduledoc """
  Um módulo que fornece internacionalização com uma API baseada em gettext.

  Usando [Gettext] (https://hexdocs.pm/gettext),
  seu módulo ganha um conjunto de macros para traduções, por exemplo:

      import RocketpayWeb.Gettext

      # Tradução simples
      gettext ("Aqui está a string a ser traduzida")

      # Tradução no plural
      ngettext ("Aqui está a string a ser traduzida",
               "Aqui estão as strings a serem traduzidas",
               3)

      # Tradução baseada em domínio
      dgettext ("errors", "Aqui está a mensagem de erro a ser traduzida")

  Consulte o [Gettext Docs] (https://hexdocs.pm/gettext) para obter detalhes sobre o uso.
  """
  use Gettext, otp_app: :rocketpay
end
