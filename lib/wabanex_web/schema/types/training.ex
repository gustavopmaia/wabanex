defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercise

  @desc "Logic training representation"
  object :training do
    field :id, non_null(:uuid4), description: "Training id"
    field :start_date, non_null(:string), description: "Training start date"
    field :end_date, non_null(:string), description: "Training end date"
    field :exercises, list_of(:exercise)
  end

  @desc "Input training"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4), description: "User id"
    field :start_date, non_null(:string), description: "Training start date"
    field :end_date, non_null(:string), description: "Training end date"
    field :exercises, list_of(:create_exercise_input)
  end
end
