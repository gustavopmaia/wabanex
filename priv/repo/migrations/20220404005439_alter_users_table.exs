defmodule Wabanex.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add_if_not_exists :height, :float
      add_if_not_exists :weight, :float
      add_if_not_exists :fi, :float
      add_if_not_exists :mi, :float
    end
  end

  def up do
    alter table(:users) do
      add_if_not_exists :height, :float
      add_if_not_exists :weight, :float
      add_if_not_exists :fi, :float
      add_if_not_exists :mi, :float
    end
  end

  def down do
    alter table(:users) do
      remove :height
      remove :weight
      remove :fi
      remove :mi
    end
  end
end
