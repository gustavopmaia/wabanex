defmodule Wabanex.Users.StoreToken do
  alias Wabanex.User
  alias Wabanex.Repo

  def store_token(%User{} = user, token) do
    user
    |> User.store_token_changeset(%{token: token})
    |> Repo.update()
  end
end
