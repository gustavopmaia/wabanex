defmodule Wabanex.Users.Delete do
  alias Wabanex.{Repo}
  alias Wabanex.Users.Get

  def call(params) do
    {:ok, user} = Get.call(params.id)

    user
    |> Repo.update()
  end
end
