defmodule ToDoAPIWeb.UserController do
  use ToDoAPIWeb, :controller

  require Logger
  require String.Chars

  alias ToDoAPI.Res
  alias ToDoAPI.Res.User

  action_fallback ToDoAPIWeb.FallbackController

  #Une fonction prends tjs conn en premier paramètre.
  #Paramètre de l'URL -> email qui sera retranscrite dans la variable email
  #username qui sera retranscrit dans la variable username
  #http://localhost:4000/api/users?email=email@email.com&username=email
  def index(conn, %{"email" => email, "username" => username}) do
    user = Res.get_user_email_username(email, username)
    Logger.info(inspect(user, pretty: true))
    render(conn, "show.json", user: user)
  end
  #Fonction qui recevra toutes les URL http://localhost:4000/api/users blablabla (donc users sans /)
  #Renvoyer une erreur
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
      Logger.info(inspect(user))
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Res.get_user!(id)

    with {:ok, %User{}} <- Res.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
  #sign_in expect object body like this
  # {
	#   "email": "Retest.test@ddddd",
	#   "password": "password"
  # }
  def sign_in(conn, %{"email" => email, "password" => password}) do
    Logger.info("SignInMethod")
    Logger.info(inspect(Res.token_sign_in(email, password)))
    case Res.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        conn |> render("jwt.json", jwt: token)
      _ ->
        Logger.info("Error sign-in")
        {:error, :unauthorized}
    end
  end
end
