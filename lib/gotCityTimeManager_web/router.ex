defmodule ToDoAPIWeb.Router do
  use ToDoAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToDoAPIWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    #a GET method : http://localhost:4000/api/users?email=XXX&username=YYY
    resources "/workingtimes", WorkingtimeController, except: [:new, :edit, :index, :show, :create]
    #resources "/clocks", ClockController, only: [:show, :create]

    get "/workingtimes/:user_id", WorkingtimeController, :testGetAllwtForUserId
    get "/workingtimes/:user_id/:workingtime_id", WorkingtimeController, :testRoute
    post "/workingtimes/:user_id", WorkingtimeController, :testAddWorkingtime
    get "/clocks/:user_id", ClockController, :testGetAllClock
    post "/clocks/:user_id", ClockController, :testGetLastClock
  end
end
