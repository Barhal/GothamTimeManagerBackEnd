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
    render(conn, "index.json-api", data: workingtimes)
  end

  def create(conn, %{"workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- Res.create_workingtime(workingtime_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json-api", data: workingtime)
    end
  end

  # http://localhost:4000/api/workingtimes/1?start=1991-02-21%2009%3A15%3A45&end=2025-02-21%2023%3A30%3A45
  def show(conn, %{"id" => user_id, "start" => start_value, "end" => end_value}) do
    workingtimes = Res.get_multiple_workingtimes(user_id, start_value, end_value)
    render(conn, "index.json-api", data: workingtimes)
  end

  def show(conn, %{"id" => id}) do
    Logger.info(inspect(conn, pretty: true))
    workingtime = Res.get_workingtime!(id)
    render(conn, "show.json-api", data: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Res.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <-
           Res.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json-api", data: workingtime)
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
    render(conn, "show.json-api", data: workingtime)
  end

  # http://localhost:4000/api/workingtimes?start=1991-02-21%2009%3A15%3A45&end=2025-02-21%2023%3A30%3A45
  def get_workingtime_current_user(conn, %{"start" => start_value, "end" => end_value}) do
    current_user = Guardian.Plug.current_resource(conn)
    Logger.info(inspect(current_user, pretty: true))
    workingtimes = Res.get_multiple_workingtimes(current_user.id, start_value, end_value)
    render(conn, "index.json-api", data: workingtimes)
  end

  def get_workingtimes_specific_user(conn, %{"user_id" => user_id, "start" => start_value, "end" => end_value}) do
    workingtimes = Res.get_multiple_workingtimes(user_id, start_value, end_value)
    render(conn, "index.json-api", data: workingtimes)
  end

  def get_workingtimes_specific_user_in_manager_team(conn, %{"user_id" => user_id, "start" => start_value, "end" => end_value}) do
    current_user = Guardian.Plug.current_resource(conn)
    target_user = Res.get_user!(user_id)
    Logger.info(inspect(current_user, pretty: true))
    Logger.info(inspect(target_user, pretty: true))
    if current_user.team_id == target_user.team_id do
      workingtimes = Res.get_multiple_workingtimes(user_id, start_value, end_value)
      render(conn, "index.json-api", data: workingtimes)
    else
      conn
        |> put_status(:unauthorized)
        |> put_view(ToDoAPIWeb.ErrorView)
        |> render("401.json")
    end
  end

  def get_all_workingtimes_date_range_admin(conn, %{"start" => start_value, "end" => end_value}) do
    workingtimes = Res.get_all_workingtimes_date_range_admin(start_value, end_value)
    render(conn, "index.json-api", data: workingtimes)
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
      # |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json-api", data: workingtime)
    end
  end

  def get_team_workingtimes(conn, %{"start" => start_value, "end" => end_value}) do
    Logger.info("get_team_workingtime")
    current_user = Guardian.Plug.current_resource(conn)
    Logger.info(inspect(current_user, pretty: true))
    workingtimes = Res.get_workingtimes_from_team(current_user.team_id, start_value, end_value)
    Logger.info(inspect(workingtimes, pretty: true))
    # render(conn, "index.json", workingtimes: workingtimes)
    render(conn, "index.json-api", data: workingtimes, opts: [include: "user"])
  end

  def create_workingtimes_manager(conn, %{"user_id" => user_id, "workingtime" => workingtime_params}) do
    current_user = Guardian.Plug.current_resource(conn)
    user = Res.get_user!(user_id)
    # Check if the user is in the team of the manager
    if current_user.team_id === user.team_id do
      with {:ok, %Workingtime{} = workingtime} <-
             Res.create_workingtime_start_end_user(
               workingtime_params["start"],
               workingtime_params["end"],
               user_id
             ) do
        conn
        |> put_status(:created)
        |> render("show.json-api", data: workingtime)
      end
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(ToDoAPIWeb.ErrorView)
      |> render("405.json")
    end
  end

  def update_workingtimes_manager(conn, %{"workingtime_id" => workingtime_id, "workingtime" => workingtime_params}) do
    current_user = Guardian.Plug.current_resource(conn)
    user = Res.get_user!(workingtime_params["user"])
    # Check if the user is in the team of the manager
    if current_user.team_id === user.team_id do
      workingtime = Res.get_workingtime!(workingtime_id)

      with {:ok, %Workingtime{} = workingtime} <-
             Res.update_workingtime(workingtime, workingtime_params) do
        render(conn, "show.json-api", data: workingtime)
      end
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(ToDoAPIWeb.ErrorView)
      |> render("405.json")
    end
  end

  def delete_workingtimes_manager(conn, %{"workingtime_id" => workingtime_id}) do
    current_user = Guardian.Plug.current_resource(conn)
    workingtime = Res.get_workingtime_and_user(workingtime_id)
    # Logger.info(inspect(workingtime.user_id, pretty: true))
    # Check if the user is in the team of the manager
    if current_user.team_id === workingtime.user.team_id do

      with {:ok, %Workingtime{}} <- Res.delete_workingtime(workingtime) do
        send_resp(conn, :no_content, "")
      end
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(ToDoAPIWeb.ErrorView)
      |> render("405.json")
    end
  end
end

# def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
#   workingtime = Res.get_workingtime!(id)

#   with {:ok, %Workingtime{} = workingtime} <-
#          Res.update_workingtime(workingtime, workingtime_params) do
#     render(conn, "show.json-api", workingtime: workingtime)
#   end
# end
