defmodule ToDoAPI.Repo do
  use Ecto.Repo,
    otp_app: :gotCityTimeManager,
    adapter: Ecto.Adapters.Postgres
end
