defmodule Client.Repo do
  use Ecto.Repo,
    otp_app: :client,
    adapter: Ecto.Adapters.Postgres
end
