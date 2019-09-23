defmodule ToDoAPIWeb.ClockView do
  # use ToDoAPIWeb, :view
  # alias ToDoAPIWeb.ClockView

  # def render("index.json", %{clocks: clocks}) do
  #   %{data: render_many(clocks, ClockView, "clock.json")}
  # end

  # def render("show.json", %{clock: clock}) do
  #   %{data: render_one(clock, ClockView, "clock.json")}
  # end

  # def render("clock.json", %{clock: clock}) do
  #   %{id: clock.id,
  #     time: clock.time,
  #     status: clock.status,
  #     user: clock.user}
  # end
  use ToDoAPIWeb, :view
  use JaSerializer.PhoenixView

  attributes [:time, :status, :user_id]

  has_one :user,
    include: false,
    serializer: ToDoAPIWeb.UserView,
    identifiers: :when_included
end
