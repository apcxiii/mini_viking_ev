defmodule MiniViking.Accounts.User do
  @moduledoc """
  The User schema.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :role, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :role])
    |> validate_required([:first_name, :last_name, :email, :role])
  end
end
