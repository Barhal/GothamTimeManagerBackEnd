# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gotCityTimeManager,
  namespace: ToDoAPI,
  ecto_repos: [ToDoAPI.Repo]

# Configures the endpoint
config :gotCityTimeManager, ToDoAPIWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "68UTh5kzw+ooFPLtGC28dKm3WrQprmacngXAMIdt0XkntYQiTAQFaqcNbtqoA60+",
  render_errors: [view: ToDoAPIWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ToDoAPI.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :ToDoAPI, ToDoAPI.Guardian,
       issuer: "gotCityTimeManager",
       secret_key: "KrcEr70LkPqXBUut/DH+2r5V2dt0dPr7zj6eEtn2FzsMmBZvQHmX+gkV3/clZqpM"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
