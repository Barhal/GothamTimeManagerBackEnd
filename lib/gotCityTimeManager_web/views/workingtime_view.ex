defmodule ToDoAPIWeb.WorkingtimeView do
  # use ToDoAPIWeb, :view
  # alias ToDoAPIWeb.WorkingtimeView
  # alias ToDoAPIWeb.UserView

  # def render("index.json", %{workingtimes: workingtimes}) do
  #   %{data: render_many(workingtimes, WorkingtimeView, "workingtime.json")}
  # end

  # def render("show.json", %{workingtime: workingtime}) do
  #   %{data: render_one(workingtime, WorkingtimeView, "workingtime.json")}
  # end

  # def render("workingtime.json", %{workingtime: workingtime}) do
  #   %{id: workingtime.id,
  #     start: workingtime.start,
  #     end: workingtime.end,
  #     user: render_one(workingtime.user, UserView, "user.json")}
  # end

  #def render("")


  use ToDoAPIWeb, :view
  use JaSerializer.PhoenixView

  attributes [:start, :end, :user_id]

  has_one :user,
    include: false,
    serializer: ToDoAPIWeb.UserView,
    identifiers: :when_included
end
