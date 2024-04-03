defmodule MiniViking.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MiniVikingWeb.Telemetry,
      MiniViking.Repo,
      {DNSCluster, query: Application.get_env(:mini_viking, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MiniViking.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MiniViking.Finch},
      # Start a worker by calling: MiniViking.Worker.start_link(arg)
      # {MiniViking.Worker, arg},
      # Start to serve requests, typically the last entry
      MiniVikingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MiniViking.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MiniVikingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
