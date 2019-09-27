defmodule ToDoAPIWeb.UserController do
  use ToDoAPIWeb, :controller

  require Logger
  require String.Chars
  require Map
  alias ToDoAPI.Res
  alias ToDoAPI.Res.User

  action_fallback ToDoAPIWeb.FallbackController

  # Une fonction prends tjs conn en premier paramètre.
  # Paramètre de l'URL -> email qui sera retranscrite dans la variable email
  # username qui sera retranscrit dans la variable username
  # http://localhost:4000/api/users?email=email@email.com&username=email
  def index(conn, %{"email" => email, "username" => username}) do
    user = Res.get_user_email_username(email, username)
    Logger.info(inspect(user, pretty: true))
    render(conn, "show.json-api", data: user)
  end

  # Fonction qui recevra toutes les URL http://localhost:4000/api/users blablabla (donc users sans /)
  # Renvoyer une erreur
  def index(conn, _params) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ToDoAPIWeb.ErrorView)
    |> render("405.json")
  end

  @spec create(any, map) :: any
  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Res.create_user(user_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json-api", data: user)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    user = Res.get_user!(id)
    render(conn, "show.json-api", data: user)
  end

  def show_guardian(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    conn |> render("show.json-api", data: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Res.get_user!(id)

    with {:ok, %User{} = user} <- Res.update_user(user, user_params) do
      render(conn, "show.json-api", data: user)
    end
  end

  def get_specific_user_email_username_from_admin(conn, %{
        "email" => email,
        "username" => username
      }) do
    user = Res.get_user_email_username(email, username)
    render(conn, "show.json-api", data: user)
  end

  def get_all_users_from_admin(conn, %{}) do
    users = Res.list_users()
    render(conn, "index.json-api", data: users)
  end

  def get_list_employee_in_team_from_admin(conn, %{"team_id" => team_id}) do
    users = Res.get_employee_from_team(team_id)
    render(conn, "index.json-api", data: users)
  end

  # {
  #   "user" : {
  #     "email": "arnaud9@ddddd",
  #     "password": "password",
  #     "password_confirmation": "password",
  #     "username": "arnaud9",
  #     "team_id": 3,
  #     "role": "employee"
  #   }
  # }
  # http://localhost:4000/api/adm/users      Paramètres "team_id" et "role" non obligatoire
  def create_new_user_from_admin(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Res.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json-api", data: user)
    end
  end

  def update_user_from_admin(conn, %{"user_id" => user_id, "user" => user_params}) do
    user = Res.get_user!(user_id)

    with {:ok, %User{} = user} <- Res.update_user(user, user_params) do
      render(conn, "show.json-api", data: user)
    end
  end

  def update_current_user(conn, %{"user" => user_params}) do
    current_user = Guardian.Plug.current_resource(conn)
    user = Res.get_user!(current_user.id)

    with {:ok, %User{} = user} <- Res.update_current_user(user, user_params) do
      render(conn, "show.json-api", data: user)
    end
  end

  def delete_user_from_admin(conn, %{"user_id" => user_id}) do
    user = Res.get_user!(user_id)

    with {:ok, %User{}} <- Res.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Res.get_user!(id)

    with {:ok, %User{}} <- Res.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def get_all_roles(conn, %{}) do
    r = Res.get_all_roles()
    roles = Enum.to_list(r)
    render(conn, "roles.json-api", roles: roles)
  end

  # sign_in expect object body like this
  # {
  #   "email": "Retest.test@ddddd",
  #   "password": "password"
  # }
  def sign_in(conn, %{"email" => email, "password" => password}) do
    Logger.info("signin")

    case Res.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        conn |> render("jwt.json-api", jwt: token)

      _ ->
        {:error, :unauthorized}
    end
  end

  def get_list_employee_from_manager(conn, %{}) do
    current_user = Guardian.Plug.current_resource(conn)
    users = Res.get_employee_from_team(current_user.team_id)
    render(conn, "index.json-api", data: users)
  end
end
