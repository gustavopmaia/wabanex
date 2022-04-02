defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:email, :password, :name]
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
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
