defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @fields [:email, :password, :name, :height, :weight, :fi, :mi]

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :height, :float
    field :weight, :float
    field :fi, :float
    field :mi, :float

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_number(:height, greater_than: 50.0, less_than: 350.0)
    |> validate_number(:weight, greater_than: 10.0, less_than: 400.0)
    |> validate_number(:fi, greater_than: 0.0, less_than: 101.0)
    |> validate_number(:mi, greater_than: 0.0, less_than: 101.0)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password, hash_key: :password))
  end

  defp put_password_hash(changeset), do: changeset
end
