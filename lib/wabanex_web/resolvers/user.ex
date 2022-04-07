defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.Users.Get.call(user_id)
  def create(%{input: params}, _context), do: Wabanex.Users.Create.call(params)
  def update(%{input: params}, _context), do: Wabanex.Users.Update.call(params)
  def delete(%{input: params}, _context), do: Wabanex.Users.Delete.call(params)

  def login(%{email: email, password: password}, _context) do
    with {:ok, user} <- Wabanex.Users.ValidatePassword.call(%{email: email, password: password }),
         {:ok, jwt, _} <- Wabanex.Guardian.encode_and_sign(user),
         {:ok, _} <- Wabanex.Users.StoreToken.store_token(user, jwt) do
           {:ok, %{token: jwt}}
         end
  end
end
