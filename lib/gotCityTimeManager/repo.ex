defmodule ToDoAPI.Repo do
  use Ecto.Repo,
    otp_app: :gotCityTimeManager,
    adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config =
      config
      |> Keyword.put(:username, System.get_env("DB_USER"))
      |> Keyword.put(:password, System.get_env("DB_PASSWORD"))
      |> Keyword.put(:database, System.get_env("DB_NAME"))
      |> Keyword.put(:hostname, System.get_env("DB_HOST"))
      |> Keyword.put(:port, System.get_env("DB_PORT") |> String.to_integer())

    {:ok, config}
  end
end
