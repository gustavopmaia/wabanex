defmodule WabanexWeb.Resolvers.Training do
  # def create(%{input: params}, _context), do: Wabanex.Trainings.Create.call(params)
  def create(args, %{context: %{current_user: _current_user}}), do: Wabanex.Trainings.Create.call(args)
  def create(_args, _info), do: {:error, "Not Authorized"}
end
