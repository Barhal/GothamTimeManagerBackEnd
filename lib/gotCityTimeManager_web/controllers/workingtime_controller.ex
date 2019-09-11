defmodule ToDoAPIWeb.WorkingtimeController do
  use ToDoAPIWeb, :controller

  require Logger
  require Ecto

  alias ToDoAPI.Res
  alias ToDoAPI.Res.Workingtime

  action_fallback ToDoAPIWeb.FallbackController

  def index(conn, _params) do
    Logger.info(inspect(conn, pretty: true))
    workingtimes = Res.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Res.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    Logger.info(inspect(conn, pretty: true))
    workingtime = Res.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Res.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Res.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Res.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Res.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
  def testGetAllwtForUserId(conn,  %{"user_id" => user_id}) do
    Logger.info(inspect(user_id))
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.params
    #Logger.info(inspect(conn, pretty: true))
    Logger.info(inspect(params, pretty: true))
    work = Res.get_multiple_workingtimes(params)
    Logger.info(inspect(work, pretty: true))
    #render(conn, "show.jon", workingtimes: workingtimes)
    #json(conn, work)
    json(conn, %{work: work})
    #{userid, _} = Integer.parse(user_id)
    #users = Enum.filter(Res.list_users(), fn(user) -> user.username == params["username"] && user.email == params["email"] end)
    #render(conn, "index.json", users: users)
    #workingtimes = Enum.filter(Res.list_workingtimes(), fn(workingtime) -> workingtime.user == userid && workingtime.start == params["start"] && workingtime.end == params["end"] end)
    #workingtimes = Enum.filter(Res.list_workingtimes(), fn(workingtime) -> workingtime.user == userid && workingtime.start <= params["start"] && workingtime.end <= params["end"] end)

    #Logger.info(inspect(workingtimes, pretty: true))
    #render(conn, "index.json", workingtimes: workingtimes)
    #send_resp(conn, :no_content, "")
  end

  @spec testRoute(Plug.Conn.t(), any) :: Plug.Conn.t()
  def testRoute(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.params
    Logger.info(inspect(conn, pretty: true))
    Logger.info(inspect(params, pretty: true))
    work = Res.get_workingtimes(params)
    json(conn, %{work: work})
    #send_resp(conn, :no_content, "")
  end

  def testAddWorkingtime(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.params
    {userid, _} = Integer.parse(params["user_id"])
    Logger.info(inspect(conn, pretty: true))
    Logger.info(inspect(params, pretty: true))
    Logger.info(inspect(params["workingtime"]["user"], pretty: true))
    if params["workingtime"]["user"] != userid do
      Logger.info("not true")
      #Send an error
      send_resp(conn, :no_content, "")
    end
    if params["workingtime"]["user"] == userid || params["workingtime"]["user"] === nil  do
      #fonction
      Logger.info("true")
      #workingtime = Res.create_workingtimeWithUserId(params)
      #Logger.info(inspect(workingtime, pretty: true))
      with {:ok, %Workingtime{} = workingtime} <- Res.create_workingtimeWithUserId(params) do
        conn
        |> put_status(:created)
        #|> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
        |> render("show.json", workingtime: workingtime)
      end
      #json conn |> put_status(:created), workingtime
      #render(conn, "show.json", workingtime: workingtime)
      #json(conn, %{work: work})
    end
    #send_resp(conn, :no_content, "")
  end
end
