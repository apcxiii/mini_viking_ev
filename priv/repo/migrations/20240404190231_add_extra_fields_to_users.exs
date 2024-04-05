defmodule MiniViking.Repo.Migrations.AddExtraFieldsToUsers do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add(:job_title, :string)
      add(:about, :text)
    end
  end

  def down do
    alter table(:users) do
      remove(:job_title)
      remove(:about)
    end
  end
end
