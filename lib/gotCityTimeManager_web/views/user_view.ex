defmodule ToDoAPIWeb.UserView do
  # use ToDoAPIWeb, :view
  # alias ToDoAPIWeb.UserView
  # alias ToDoAPIWeb.TeamView

  # def render("index.json", %{users: users}) do
  #   %{data: render_many(users, UserView, "user.json")}
  # end

  # def render("show.json", %{user: user}) do
  #   %{data: render_one(user, UserView, "user.json")}
  # end

  # def render("user.json", %{user: user}) do
  #   %{id: user.id,
  #     username: user.username,
  #     email: user.email,
  #     role: user.role,
  #     team: render_one(user.team, TeamView, "team.json")
  #   }
  # end
  def render("jwt.json-api", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  use ToDoAPIWeb, :view
  use JaSerializer.PhoenixView

  attributes [:username, :email, :role]

  has_one :team,
    include: true,
    serializer: ToDoAPIWeb.TeamView
end
