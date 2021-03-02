defmodule RocketpayWeb.UserSocket do
  use Phoenix.Socket

  ## Canais
  # channel "room: *", RocketpayWeb.RoomChannel

  # Os parâmetros de soquete são passados do cliente e podem
  # ser usado para verificar e autenticar um usuário. Depois de
  # verificação, você pode colocar atribuições padrão em
  # o soquete que será definido para todos os canais, ou seja,
  #
  # {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # Para negar a conexão, retorne `:error`.
  #
  # Veja a documentação do `Phoenix.Token` para exemplos em
  # realizando verificação de token na conexão.
  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  # Socket id's são tópicos que permitem identificar todos os sockets para um determinado usuário:
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Permitiria que você transmitisse um evento de "disconnect" e encerrasse
  # todos os soquetes e canais ativos para um determinado usuário:
  #     RocketpayWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Retornar `nil` torna este socket anônimo.
  @impl true
  def id(_socket), do: nil
end
