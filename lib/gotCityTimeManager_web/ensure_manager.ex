defmodule ToDoAPIWeb.Plug.EnsureManager do
  @moduledoc """
  This plug makes sure that the authenticated user is a super user,
  otherwise it halts the connection.
  """
  import Plug.Conn
  import Phoenix.Controller

  alias ToDoAPIWeb.ErrorView
  alias ToDoAPI.Res.User
  alias ToDoAPI.Repo

  require Logger

  def init(opts), do: Enum.into(opts, %{})

  def call(conn, opts \\ []) do
    check_manager(conn, opts)
  end

  defp check_manager(conn, _opts) do
    current_user = Guardian.Plug.current_resource(conn)
    Logger.info("checkmanager")
    Logger.info(inspect(current_user, pretty: true))
    case Repo.get_by(User, %{id: current_user.id, role: "manager"}) do
      nil -> halt_plug(conn)
      user -> assign(conn, :user, user)
    end
  end

  defp halt_plug(conn) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ToDoAPIWeb.ErrorView)
    |> render("401.json")
    |> halt()
  end
end
