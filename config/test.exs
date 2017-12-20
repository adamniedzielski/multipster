use Mix.Config

config :multipster, MultipsterWeb.Endpoint,
  http: [port: 4001],
  server: true

config :multipster, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :multipster, Multipster.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "multipster_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :wallaby,
  driver: Wallaby.Experimental.Chrome
