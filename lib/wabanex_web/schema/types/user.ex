defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4), description: "User id"
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :height, non_null(:float), description: "User height"
    field :weight, non_null(:float), description: "User weight"
    field :fi, non_null(:float), description: "User fat index"
    field :mi, non_null(:float), description: "User muscle index"
    field :trainings, list_of(:training), description: "User trainings"
  end

  @desc "Input user"
  input_object :create_user_input do
    field :name, non_null(:string), description: "User name"
    field :email, non_null(:string), description: "User email"
    field :password, non_null(:string), description: "User password"
    field :height, non_null(:float), description: "User height"
    field :weight, non_null(:float), description: "User weight"
    field :fi, non_null(:float), description: "User fat index"
    field :mi, non_null(:float), description: "User muscle index"
  end

  @desc "Update user"
  input_object :update_user_object do
    field :id, non_null(:uuid4), description: "User ID"
    field :name, :string, description: "User name"
    field :email, :string, description: "User email"
    field :password, :string, description: "User password"
    field :height, :float, description: "User height"
    field :weight, :float, description: "User weight"
    field :fi, :float, description: "User fat index"
    field :mi, :float, description: "User muscle index"
  end

  @desc "Delete user"
  input_object :delete_user_object do
    field :id, non_null(:uuid4), description: "User ID to delete"
  end
end
