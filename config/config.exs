# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :multipster, ecto_repos: [Multipster.Repo]

# Configures the endpoint
config :multipster, MultipsterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IwDMYVO9MfIwLO9ybwNU+IFJNhNxtCaXwC3xtUgIgBKriU6wOgVQJ26IvFhtgktC",
  render_errors: [view: MultipsterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Multipster.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :multipster, Multipster.CurrentTime, adapter: Multipster.CurrentTime.Real

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
