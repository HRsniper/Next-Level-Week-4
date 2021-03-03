defmodule Rocketpay.Users.GetResource do
  alias Rocketpay.{Account, Repo, User}

  def get_resource_by_id!(id) do
    Repo.get!(User, id)
  end
end
