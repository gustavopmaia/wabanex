defmodule Wabanex.Users.Update do
  alias Wabanex.{User, Repo}
  alias Wabanex.Users.Get

  def call(params) do
    {:ok, user} = Get.call(params.id)

    user
    |> User.update_changeset(params)
    |> Repo.update()
  end
end
