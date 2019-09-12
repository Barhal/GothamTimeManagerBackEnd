defmodule ToDoAPIWeb.ClockController do
  use ToDoAPIWeb, :controller

  require Logger
  import Ecto

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
      #|> put_resp_header("location", Routes.clock_path(conn, :show, clock))
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
    clocks = Res.get_clocksLastTimeFromUser(user_id)
    render(conn, "show.json", clock: clocks)
  end

  #def testGetAllClock(conn, _params) do
  def post_clock_for_user(conn, %{"user_id" => user_id}) do
    time = Elixir.NaiveDateTime.add(Elixir.NaiveDateTime.utc_now(), 7200, :second)

    with {:ok, %Clock{} = clock} <- Res.post_clock(user_id, time) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  # def testGetAllClock(conn, _params) do
  #  conn = Plug.Conn.fetch_query_params(conn)
  #  params = conn.params
  # {userid, _} = Integer.parse(params["user_id"])
  #  Logger.info(inspect(conn, pretty: true))
  #  Logger.info(inspect(params, pretty: true))
  #  clocks = Res.get_clocksAllForUser(params)
  #  Logger.info(inspect(clocks))
  #  render(conn, "index.json", clocks: clocks)
  # end

  #def testGetLastClock(conn, _params) do
  #  Logger.info("gtestGetLastClock")
  #  conn = Plug.Conn.fetch_query_params(conn)
  #  params = conn.params
  #  Logger.info(inspect(params, pretty: true))
  #  {userid, _} = Integer.parse(params["user_id"])

  #  if params["clock"]["user"] != userid do
  #    Logger.info("not true")
      # Send an error
  #    send_resp(conn, :no_content, "")
  #  end

  #  if params["clock"]["user"] == userid || params["clock"]["user"] === nil do
      # clocks = Res.get_clocksLastTimeFromUser(params)
      # Logger.info(inspect(clocks, pretty: true))
  #    clocksupdated = Res.post_clocksCreate(params)
  #    IO.inspect(clocksupdated)
      # IO.inspect(clocks)
      # Logger.info("dd#{inspect(clocksupdated)}")
      # render(conn, "index.json", clocksupdated: clocksupdated)
      # json(conn, %{clock: clocksupdated})
  #    send_resp(conn, :no_content, "")
  #  end

  #  send_resp(conn, :no_content, "")
  #end
end
