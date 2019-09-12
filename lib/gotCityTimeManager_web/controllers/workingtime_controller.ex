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

  # http://localhost:4000/api/workingtimes/1?start=1991-02-21%2009%3A15%3A45&end=2025-02-21%2023%3A30%3A45
  def show(conn, %{"id" => user_id, "start" => start_value, "end" => end_value}) do
    workingtimes = Res.get_multiple_workingtimes(user_id, start_value, end_value)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def show(conn, %{"id" => id}) do
    Logger.info(inspect(conn, pretty: true))
    workingtime = Res.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Res.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <-
           Res.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Res.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Res.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end

  # http://localhost:4000/api/workingtimes/2/4
  def get_one_workingtime(conn, %{"user_id" => user_id, "workingtime_id" => workingtime_id}) do
    workingtime = Res.get_workingtime_userid_workingtime_id(user_id, workingtime_id)
    render(conn, "show.json", workingtime: workingtime)
  end

  # http://localhost:4000/api/workingtimes/1
  def create_workingtime(conn, %{"user_id" => user_id, "workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <-
           Res.create_workingtime_start_end_user(
             workingtime_params["start"],
             workingtime_params["end"],
             user_id
           ) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end
end
