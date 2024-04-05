defmodule MiniViking.Accounts.User do
  @moduledoc """
  The User schema.
  """

  use Ecto.Schema
  import Ecto.Changeset

  @attrs [:first_name, :last_name, :email, :role, :job_title, :about, :status]
  @attrs_required [:first_name, :last_name, :email, :role, :status]

  schema "users" do
    field :role, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :job_title, :string
    field :about, :string
    field :status, :boolean
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @attrs)
    |> validate_required(@attrs_required)
    |> validate_length(:job_title, max: 150)
    |> validate_length(:about, max: 3000)
  end
end
