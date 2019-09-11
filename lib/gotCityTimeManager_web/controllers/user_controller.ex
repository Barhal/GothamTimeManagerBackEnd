defmodule ToDoAPIWeb.UserController do
  use ToDoAPIWeb, :controller

  require Logger
  require String.Chars

  alias ToDoAPI.Res
  alias ToDoAPI.Res.User

  action_fallback ToDoAPIWeb.FallbackController
  #Une fonction prends tjs conn en premier paramètre.
  #Paramètre de l'URL -> l'id de l'utilisateur qui sera retranscrit dans la variable userID
  #email qui sera retranscrite dans la variable email
  #username qui sera retranscrit dans la variable username
  def index(conn, %{"id" => userID}, %{"email" => email}, %{"username" => username}) do

  end
  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    Logger.info(inspect(conn, pretty: true))
    conn = Plug.Conn.fetch_query_params(conn)
    #users = Res.list_users()
    Logger.info(inspect(conn, pretty: true))
    params = conn.query_params
    Logger.info("Para1111: #{inspect(params)}")
    users = Enum.filter(Res.list_users(), fn(user) -> user.username == params["username"] && user.email == params["email"] end)
    render(conn, "index.json", users: users)
  end

  @spec create(any, map) :: any
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Res.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    user = Res.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Res.get_user!(id)

    with {:ok, %User{} = user} <- Res.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Res.get_user!(id)

    with {:ok, %User{}} <- Res.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
