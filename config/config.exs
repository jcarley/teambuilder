# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :teambuilder,
  ecto_repos: [Trunkmonkey.Repo]

# Configures the endpoint
config :teambuilder, Trunkmonkey.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cj0nEIF3HDwYHhCALh1rjkb/q294WvDjCSKmCben4U8LQmR29AWhBw+Smf8YJTEl",
  render_errors: [view: Trunkmonkey.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Trunkmonkey.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"