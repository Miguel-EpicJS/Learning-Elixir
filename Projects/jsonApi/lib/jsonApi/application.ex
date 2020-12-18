defmodule JsonApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      JsonApi.Repo,
      # Start the Telemetry supervisor
      JsonApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: JsonApi.PubSub},
      # Start the Endpoint (http/https)
      JsonApiWeb.Endpoint
      # Start a worker by calling: JsonApi.Worker.start_link(arg)
      # {JsonApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JsonApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    JsonApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
