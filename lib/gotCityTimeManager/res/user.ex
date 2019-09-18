defmodule ToDoAPI.Res.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string, null: false
    field :role, :string
    field :team, :id

    timestamps()
  end

  @email ~r/\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> unique_constraint(:username, message: "Username must be unique")
    |> validate_format(:email, @email, message: "use the correct format for an email: example@gg.com")
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/, message: "Only letters, numbers and underscores")
    |> validate_length(:username, min: 5, message: "At least 5 characters")
    |> validate_length(:username, max: 25, message: "Max 25 characters")
  end
end
