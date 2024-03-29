defmodule ToDoAPIWeb.ClockController do
  use ToDoAPIWeb, :controller

  require Logger

  alias ToDoAPI.Res
  alias ToDoAPI.Res.Clock

  action_fallback ToDoAPIWeb.FallbackController

  def index(conn, _params) do
    clocks = Res.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Res.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"id" => id}) do
    clock = Res.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Res.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Res.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Res.get_clock!(id)

    with {:ok, %Clock{}} <- Res.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end

  # http://localhost:4000/api/clocks/2
  def get_clocks_for_user(conn, %{"user_id" => user_id}) do
    clocks = Res.get_clock_user(user_id)
    render(conn, "index.json", clocks: clocks)
  end

  def get_last_clock_for_user(conn, %{"user_id" => user_id}) do
    clocks = Res.get_last_clock_user(user_id)
    render(conn, "show.json", clock: clocks)
  end

  def post_clock_for_user(conn, %{"user_id" => user_id}) do
    time = Elixir.NaiveDateTime.add(Elixir.NaiveDateTime.utc_now(), 7200, :second)

    with {:ok, %Clock{} = clock} <- Res.post_clock(user_id, time) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end
  # This method use the user.id of the token
  def post_clock_current_user(conn, %{}) do
    user = Guardian.Plug.current_resource(conn)
    time = Elixir.NaiveDateTime.add(Elixir.NaiveDateTime.utc_now(), 7200, :second)

    with {:ok, %Clock{} = clock} <- Res.post_clock(user.id, time) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

  def get_team_clocks(conn, %{}) do
    current_user = Guardian.Plug.current_resource(conn)
    clocks = Res.get_clocks_from_team(current_user.team_id)
    # Logger.info(inspect(clocks, pretty: true))
    Logger.info("here")
    render(conn, "index.json-api", data: clocks)
  end

  def get_all_status_from_admin(conn, %{}) do
    clocks = Res.get_all_last_clocks()
    render(conn, "index.json-api", data: clocks)
  end

  def get_team_status_from_admin(conn, %{"team_id" => team_id}) do
    clocks = Res.get_clocks_from_team(team_id)
    render(conn, "index.json-api", data: clocks)
  end

  def get_status_specific_user_from_admin(conn, %{"user_id" => user_id}) do
    clock = Res.get_last_clock_from_admin(user_id)
    render(conn, "index.json-api", data: clock)
  end
end
