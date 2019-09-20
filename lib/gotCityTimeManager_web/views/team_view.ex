defmodule ToDoAPIWeb.TeamView do
  use ToDoAPIWeb, :view
  alias ToDoAPIWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{id: team.id,
      name: team.name}
  end
  # use ToDoAPIWeb, :view
  # use JaSerializer.PhoenixView

  # attributes [:name]
end
