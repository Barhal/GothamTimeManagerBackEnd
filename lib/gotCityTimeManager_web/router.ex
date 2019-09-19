defmodule ToDoAPIWeb.Router do
  use ToDoAPIWeb, :router
  alias ToDoAPI.Guardian

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

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api", ToDoAPIWeb do
    pipe_through :api

    post "/sign_in", UserController, :sign_in
    resources "/users", UserController, except: [:new, :edit]
    resources "/workingtimes", WorkingtimeController, only: [:update, :delete]

    scope "/workingtimes" do
      get "/:user_id/:workingtime_id", WorkingtimeController, :get_one_workingtime
      post "/:user_id", WorkingtimeController, :create_workingtime
    end

    scope "/clocks/" do
      get "/:user_id", ClockController, :get_clocks_for_user
      get "/last/:user_id", ClockController, :get_last_clock_for_user
      post "/:user_id", ClockController, :post_clock_for_user
    end
  end

  scope "/api", ToDoAPIWeb do
    pipe_through [:api, :jwt_authenticated]
    #Test routes auth user###########################################
    get "/my_user", UserController, :show
    #################################################################
    #resources "/users", UserController, except: [:new, :edit]

  end
end
