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

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug JaSerializer.Deserializer
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  pipeline :ismanager do
    plug Guardian.AuthPipeline
    plug ToDoAPIWeb.Plug.EnsureManager
  end

  pipeline :isadmin do
    plug Guardian.AuthPipeline
    plug ToDoAPIWeb.Plug.EnsureAdmin
  end

  scope "/log", ToDoAPIWeb do
    pipe_through :json_api
    # Guest route
    resources "/users", UserController, except: [:new, :edit]
    post "/sign_in", UserController, :sign_in
  end

  scope "/api", ToDoAPIWeb do
    pipe_through [:json_api, :jwt_authenticated]
    # Employee route
    get "/me", UserController, :show_guardian
    put "/users", UserController, :update_current_user
    post "/clocks", ClockController, :post_clock_current_user
    get "/workingtimes", WorkingtimeController, :get_workingtime_current_user

    scope "/man" do
      pipe_through [:ismanager]
      # Manager route
      get "/myteam", UserController, :get_list_employee_from_specific_team
      get "/workingtimes", WorkingtimeController, :get_team_workingtime
      post "/workingtimes/:user_id", WorkingtimeController, :create_workingtimes_manager
      put "/workingtimes/:workingtime_id", WorkingtimeController, :update_workingtimes_manager
    end

    scope "/adm" do
      pipe_through [:isadmin]

      scope "/clocks" do
        # get "/:user_id", ClockController, :get_clocks_for_user
      end
    end
  end

  # scope "/api", ToDoAPIWeb do
  #   pipe_through :api

  #   post "/sign_in", UserController, :sign_in
  #   #resources "/users", UserController, except: [:new, :edit]
  # end

  # scope "/api", ToDoAPIWeb do
  #   pipe_though :api
  #   pipe_though :jwt_authenticated
  #   # Use the token to display the current user
  #   get "/me", UserController, :show_guardian
  # end

  # scope "/api", ToDoAPIWeb do
  #   pipe_through [:api, :jwt_authenticated, :ismanager]
  #   #Test routes auth user###########################################
  #   get "/my_user", UserController, :show_guardian
  #   #################################################################
  #   resources "/users", UserController, except: [:new, :edit]
  #   resources "/workingtimes", WorkingtimeController, only: [:update, :delete, :show]

  #   scope "/workingtimes" do
  #     get "/:user_id/:workingtime_id", WorkingtimeController, :get_one_workingtime
  #     post "/:user_id", WorkingtimeController, :create_workingtime
  #   end

  #   scope "/clocks/" do
  #     get "/:user_id", ClockController, :get_clocks_for_user
  #     get "/last/:user_id", ClockController, :get_last_clock_for_user
  #     post "/:user_id", ClockController, :post_clock_for_user
  #   end
  # end
  # scope "/api", ToDoAPI do
  #   pipe_through [:api, :jwt_authenticated, :isadmin]
  # end
end
