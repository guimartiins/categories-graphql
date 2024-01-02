defmodule Categories.Repo do
  use Ecto.Repo,
    otp_app: :categories,
    adapter: Ecto.Adapters.Postgres
end
