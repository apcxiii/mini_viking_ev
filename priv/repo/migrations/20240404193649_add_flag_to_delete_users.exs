defmodule MiniViking.Repo.Migrations.AddFlagToDeleteUsers do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add(:status, :boolean, default: true)
    end
  end

  def down do
    alter table(:users) do
      remove(:status)
    end
  end
end
