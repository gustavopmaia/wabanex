defmodule Wabanex.Repo.Migrations.FixUserToken do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :token, :text
    end
  end
end
