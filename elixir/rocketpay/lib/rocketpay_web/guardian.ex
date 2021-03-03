defmodule RocketpayWeb.Guardian do
  use Guardian, otp_app: :rocketpay_web

  alias Rocketpay.Users.GetResource

  def subject_for_token(resource, _claims) do
    # Você pode usar qualquer valor para o assunto (subject) do seu token, mas
    # deve ser útil para recuperar o recurso (resource) mais tarde, consulte
    # como está sendo usado na função `resource_from_claims/1`.
    # Um `id` exclusivo é um bom assunto,
    # um endereço de e-mail não exclusivo é um assunto ruim.
    sub = to_string(resource.id)
    {:ok, sub}
  end

  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(claims) do
    # Aqui, procuraremos nosso recurso (resource) a partir das reivindicações (claims),
    # o assunto (subject) pode ser encontrado na chave `sub`.
    # No `subject_for_token/2` acima, retornamos
    # o id do recurso, então aqui vamos contar com ele para procurá-lo.
    id = claims["sub"]
    resource = GetResource.get_resource_by_id!(id)
    {:ok, resource}
  end

  # def resource_from_claims(_claims) do
  #   {:error, :reason_for_error}
  # end
end

# https://github.com/ueberauth/guardian
