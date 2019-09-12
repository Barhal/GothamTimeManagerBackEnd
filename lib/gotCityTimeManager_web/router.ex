defmodule ToDoAPIWeb.Router do
  use ToDoAPIWeb, :router

  defmodule NoRouteError do
    @moduledoc """
    Exception raised when no route is found.
    """
    defexception plug_status: 404, message: "no route found", conn: nil, router: nil

    def exception(opts) do
      conn = Keyword.fetch!(opts, :conn)
      router = Keyword.fetch!(opts, :router)
      path = "/" <> Enum.join(conn.path_info, "/")

      %NoRouteError{
        message: "no route found for #{conn.method} #{path} (#{inspect(router)})",
        conn: conn,
        router: router
      }
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToDoAPIWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    # a GET method : http://localhost:4000/api/users?email=XXX&username=YYY
    resources "/workingtimes", WorkingtimeController,
      except: [:new, :edit, :index, :create]

    # resources "/clocks", ClockController, only: [:show, :create]

    #get "/workingtimes/:user_id", WorkingtimeController, :testGetAllwtForUserId
    get "/workingtimes/:user_id/:workingtime_id", WorkingtimeController, :testRoute
    post "/workingtimes/:user_id", WorkingtimeController, :testAddWorkingtime
    get "/clocks/:user_id", ClockController, :testGetAllClock
    post "/clocks/:user_id", ClockController, :testGetLastClock
  end
end
