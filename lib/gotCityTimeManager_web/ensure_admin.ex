defmodule ToDoAPIWeb.Plug.EnsureAdmin do
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
    check_admin(conn, opts)
  end

  defp check_admin(conn, _opts) do
    current_user = Guardian.Plug.current_resource(conn)
    case Repo.get_by(User, %{id: current_user.id, role: "admin"}) do
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
