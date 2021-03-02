defmodule RocketpayWeb.ErrorHelpers do
  @moduledoc """
  Conveniências para traduzir e construir mensagens de erro.
  """

  @doc """
  Traduz uma mensagem de erro usando gettext.
  """
  def translate_error({msg, opts}) do
    # Ao usar gettext, normalmente passamos as strings que queremos
    # para traduzir como um argumento estático:
    #
    # # Traduzir "é inválido" no domínio "erros"
    # dgettext ("erros", "é inválido")
    #
    # # Traduzir o número de arquivos com regras plurais
    # dngettext ("erros", "1 arquivo", "% {contagem} arquivos", contagem)
    #
    # Porque as mensagens de erro que mostramos em nossos formulários e APIs
    # são definidos dentro do Ecto, precisamos traduzi-los dinamicamente.
    # Isso exige que chamemos o módulo Gettext passando nosso gettext
    # backend como primeiro argumento.
    #
    # Observe que usamos o domínio "erros", o que significa traduções
    # deve ser gravado no arquivo errors.po. A opção: count é
    # definido por Ecto e indica que também devemos aplicar regras plurais.
    if count = opts[:count] do
      Gettext.dngettext(RocketpayWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(RocketpayWeb.Gettext, "errors", msg, opts)
    end
  end
end
