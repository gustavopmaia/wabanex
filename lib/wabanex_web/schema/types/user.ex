defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4), description: "User id"
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :trainings, list_of(:training), description: "User trainings"
  end

  @desc "Input user"
  input_object :create_user_input do
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :password, non_null(:string), description: "User password"
  end
end
