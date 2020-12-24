defmodule User.Repo do
  use Ecto.Repo,
    otp_app: :user,
    adapter: Ecto.Adapters.Postgres
end
