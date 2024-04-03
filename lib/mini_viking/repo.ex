defmodule MiniViking.Repo do
  use Ecto.Repo,
    otp_app: :mini_viking,
    adapter: Ecto.Adapters.Postgres
end
