# Script para preencher o banco de dados. Você pode executá-lo como:
# mix run priv/repo/seed.exs
#
# Dentro do script, você pode ler e escrever em qualquer um de seus
# repositórios diretamente:

Rocketpay.Repo.insert!(%Rocketpay.User{
  name: "Hercules R.",
  age: 23,
  email: "hercules@r.com",
  password: "123456",
  nickname: "HRsniper"
})

#
# Recomendamos o uso das funções bang (`insert!`, `update!`
# e assim por diante), pois eles falharão se algo der errado.
