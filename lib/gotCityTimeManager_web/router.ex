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
    resources "/workingtimes", WorkingtimeController, only: [:show, :create, :update, :delete]

    scope "/workingtimes" do
      get "/:user_id/:workingtime_id", WorkingtimeController, :get_one_workingtime
      post "/:user_id", WorkingtimeController, :create_Workingtime
    end

    scope "/clocks/" do
      get "/:user_id", ClockController, :get_clock_for_user
      post "/:user_id", ClockController, :post_clock_for_user
    end
    # resources "/clocks", ClockController, only: [:show, :create]

    #get "/workingtimes/:user_id", WorkingtimeController, :testGetAllwtForUserId
    #get "/workingtimes/:user_id/:workingtime_id", WorkingtimeController, :testRoute
    #post "/workingtimes/:user_id", WorkingtimeController, :testAddWorkingtime
    #get "/clocks/:user_id", ClockController, :testGetAllClock
    #post "/clocks/:user_id", ClockController, :testGetLastClock
  end
end
