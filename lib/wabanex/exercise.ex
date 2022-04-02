defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Training}

  @fields [:name, :protocol_description, :repetitions, :youtube_video_url]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "exercises" do
    field :name, :string
    field :protocol_description, :string
    field :repetitions, :string
    field :youtube_video_url, :string

    belongs_to :training, Training

    timestamps()
  end

  def changeset(exercise, params) do
    regex = ~r/(\b(https?|ftp|file):\/\/)?[-A-Za-z0-9+&@#\/%?=~_|!:,.;]+[-A-Za-z0-9+&@#\/%=~_|]/i

    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_format(:youtube_video_url, regex)
  end
end
