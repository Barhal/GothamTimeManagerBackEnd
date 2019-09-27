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

  use ToDoAPIWeb, :view
  use JaSerializer.PhoenixView
  alias ToDoAPIWeb.UserView

  require Logger

  def render("jwt.json-api", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("role.json-api", %{ :user => r }) do
    %{data: render_one(r, UserView, "r.json-api")}
  end

  def render("r.json-api", %{ :user => r }) do
    f = Tuple.to_list(r)
    %{_: f}
  end

  def render("roles.json-api", %{roles: roles})do
    %{data: render_many(roles, UserView, "role.json-api")}
  end

  attributes [:username, :email, :role]

  has_one :team,
    include: false,
    serializer: ToDoAPIWeb.TeamView
end
