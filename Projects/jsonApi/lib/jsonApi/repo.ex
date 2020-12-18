defmodule JsonApi.Repo do
  use Ecto.Repo,
    otp_app: :jsonApi,
    adapter: Ecto.Adapters.Postgres
end
