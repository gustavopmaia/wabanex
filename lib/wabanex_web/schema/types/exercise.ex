defmodule WabanexWeb.Schema.Types.Exercise do
  use Absinthe.Schema.Notation

  @desc "Logic exercise representation"
  object :exercise do
    field :id, non_null(:uuid4), description: "Exercise id"
    field :name, non_null(:string), description: "Exercise name"
    field :youtube_video_url, non_null(:string), description: "Exercise youtube video URL"
    field :protocol_description, non_null(:string), description: "Exercise protocol description"
    field :repetitions, non_null(:string), description: "Exercise repetitions"
  end

  @desc "Input exercise"
  input_object :create_exercise_input do
    field :name, non_null(:string), description: "Exercise name"
    field :youtube_video_url, non_null(:string), description: "Exercise youtube video URL"
    field :protocol_description, non_null(:string), description: "Exercise protocol description"
    field :repetitions, non_null(:string), description: "Exercise repetitions"
  end
end
