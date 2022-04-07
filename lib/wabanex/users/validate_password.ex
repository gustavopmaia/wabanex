defmodule Wabanex.Users.ValidatePassword do
  @moduledoc false

  alias Wabanex.Repo
  alias Wabanex.User

  def call(%{email: email, password: given_pass}) do
    user = Repo.get_by(User, email: String.downcase(email))

    cond do
      user && Argon2.check_pass(user, given_pass, hash_key: :password) ->
        {:ok, user}

      user ->
        {:error, "Incorrect login credentials"}

      true ->
        {:error, :"User not found"}
    end
  end
end
