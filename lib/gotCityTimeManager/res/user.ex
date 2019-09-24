defmodule ToDoAPI.Res.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  @derive {Jason.Encoder, only: [:email, :username]}
  schema "users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string
    field :role, :string, default: "employee"
    # Association
    belongs_to :team, ToDoAPI.Res.Team
    has_many :workingtimes, ToDoAPI.Res.Workingtime
    has_many :clocks, ToDoAPI.Res.Clock
    # Virtual fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @email ~r/\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :password_confirmation, :role, :team_id])
    |> validate_required([:username, :email, :password, :password_confirmation])
    |> assoc_constraint(:team)
    |> unique_constraint(:username, message: "Username must be unique")
    |> validate_format(:email, @email,
      message: "use the correct format for an email: example@gg.com"
    )
    |> validate_format(:username, ~r/^[a-zA-Z0-9]*$/,
      message: "Only letters, numbers and underscores"
    )
    |> validate_length(:username, min: 5, message: "At least 5 characters")
    |> validate_length(:username, max: 25, message: "Max 25 characters")
    |> validate_inclusion(:role, ["employee", "manager", "admin"])
    |> validate_length(:password, min: 6) #Check that password length is >= 6
    |> validate_confirmation(:password) #Check that password === password_confirmation
    |> put_password_hash # Add put_password_hash to changeset pipeline
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}}
        ->
          put_change(changeset, :password_hash, hashpwsalt(pass))
      _ ->
          changeset
    end
  end
end
