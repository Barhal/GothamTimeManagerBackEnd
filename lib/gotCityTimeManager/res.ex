defmodule ToDoAPI.Res do
  @moduledoc """
  The Res context.
  """

  import Ecto.Query, warn: true
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias ToDoAPI.Repo
  alias ToDoAPI.Res.User
  alias ToDoAPI.Res.Workingtime
  alias ToDoAPI.Guardian
  require Logger

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)
  # Voir doc -> https://hexdocs.pm/ecto/Ecto.Repo.html#c:get_by/3
  def get_user_email_username(email, username),
    do: Repo.get_by(User, username: username, email: email)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  #
  def update_current_user(%User{} = user, attrs) do
    Logger.info(inspect(user, pretty: true))
    Logger.info(inspect(attrs, pretty: true))
    Logger.info(inspect(attrs["username"], pretty: true))

    if attrs["password"] === attrs["password_confirmation"] do
      user
      |> User.changeset(%{
        email: attrs["email"],
        username: attrs["username"],
        password: attrs["password"],
        password_confirmation: attrs["password_confirmation"]
      })
      |> Repo.update()
    else
      {:error, :invalid_password}
    end
  end

  def get_employee_from_team(team_id) do
    User
    # |> Ecto.Query.preload([:user])
    |> where([u], u.team == ^team_id)
    |> Repo.all()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias ToDoAPI.Res.Clock

  @doc """
  Returns the list of clocks.

  ## Examples

      iex> list_clocks()
      [%Clock{}, ...]

  """
  def list_clocks do
    Repo.all(Clock)
  end

  @doc """
  Gets a single clock.

  Raises `Ecto.NoResultsError` if the Clock does not exist.

  ## Examples

      iex> get_clock!(123)
      %Clock{}

      iex> get_clock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clock!(id), do: Repo.get!(Clock, id)

  def get_clock_user(user_id) do
    Clock
    |> where([c], c.user == ^user_id)
    |> Repo.all()
  end

  def get_last_clock_user(user_id \\ %{}) do
    Repo.one(
      from c in Clock,
        order_by: [desc: c.time],
        where: c.user == ^user_id,
        select: c,
        limit: 1
    )
  end

  @doc """
  Creates a clock.

  ## Examples

      iex> create_clock(%{field: value})
      {:ok, %Clock{}}

      iex> create_clock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clock(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end

  def post_clock(user_id, time) do
    last_clock =
      Repo.one(
        from c in Clock,
          order_by: [desc: c.time],
          where: c.user == ^user_id,
          select: c,
          limit: 1
      )

    if last_clock === nil do
      %Clock{}
      |> Clock.changeset(%{time: time, status: true, user: user_id})
      |> Repo.insert()
    else
      new_status = !last_clock.status

      if new_status === false do
        %Workingtime{}
        |> Workingtime.changeset(%{start: last_clock.time, end: time, user: user_id})
        |> Repo.insert()
      end

      %Clock{}
      |> Clock.changeset(%{time: time, status: new_status, user: user_id})
      |> Repo.insert()
    end
  end

  @doc """
  Updates a clock.

  ## Examples

      iex> update_clock(clock, %{field: new_value})
      {:ok, %Clock{}}

      iex> update_clock(clock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Clock.

  ## Examples

      iex> delete_clock(clock)
      {:ok, %Clock{}}

      iex> delete_clock(clock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clock changes.

  ## Examples

      iex> change_clock(clock)
      %Ecto.Changeset{source: %Clock{}}

  """
  def change_clock(%Clock{} = clock) do
    Clock.changeset(clock, %{})
  end

  @doc """
  Returns the list of workingtimes.

  ## Examples

      iex> list_workingtimes()
      [%Workingtime{}, ...]

  """
  def list_workingtimes do
    Repo.all(Workingtime)
  end

  @doc """
  Gets a single workingtime.

  Raises `Ecto.NoResultsError` if the Workingtime does not exist.

  ## Examples

      iex> get_workingtime!(123)
      %Workingtime{}

      iex> get_workingtime!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workingtime!(id), do: Repo.get!(Workingtime, id)

  def get_workingtime_and_user(workingtime_id) do
    Workingtime
    |> where([wt], wt.id == ^workingtime_id)
    |> preload([:user])
    |> Repo.one()
  end
  # Workingtime
  #   |> where([wt], wt.start >= ^start_value and wt.end <= ^end_value)
  #   |> join(:left, [wt], user in assoc(wt, :user))
  #   |> where([wt, user], user.team_id == ^user_team)
  #   |> join(:left, [wt, user], team in assoc(user, :team))
  #   |> preload([{:user, :team}])

  def get_workingtime_userid_workingtime_id(user_id, workingtime_id),
    do: Repo.get_by(Workingtime, user: user_id, id: workingtime_id)

  @doc """
  Creates a workingtime.

  ## Examples

      iex> create_workingtime(%{field: value})
      {:ok, %Workingtime{}}

      iex> create_workingtime(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workingtime(attrs \\ %{}) do
    %Workingtime{}
    |> Workingtime.changeset(attrs)
    |> Repo.insert()
  end

  def create_workingtime_start_end_user(start_value, end_value, user_id) do
    %Workingtime{}
    |> Workingtime.changeset(%{start: start_value, end: end_value, user_id: user_id})
    |> Repo.insert()
  end

  @doc """
  Updates a workingtime.

  ## Examples

      iex> update_workingtime(workingtime, %{field: new_value})
      {:ok, %Workingtime{}}

      iex> update_workingtime(workingtime, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workingtime(%Workingtime{} = workingtime, attrs) do
    workingtime
    |> Workingtime.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Workingtime.

  ## Examples

      iex> delete_workingtime(workingtime)
      {:ok, %Workingtime{}}

      iex> delete_workingtime(workingtime)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workingtime(%Workingtime{} = workingtime) do
    Repo.delete(workingtime)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workingtime changes.

  ## Examples

      iex> change_workingtime(workingtime)
      %Ecto.Changeset{source: %Workingtime{}}

  """
  def change_workingtime(%Workingtime{} = workingtime) do
    Workingtime.changeset(workingtime, %{})
  end

  def get_multiple_workingtimes(user_id, start_value, end_value) do
    Workingtime
    |> where([wt], wt.start >= ^start_value and wt.end <= ^end_value)
    |> join(:left, [wt], user in assoc(wt, :user))
    |> where([wt, user], user.id == ^user_id)
    |> Repo.all()
  end

  def get_workingtimes_from_team(user_team, start_value, end_value) do
    # query = from w in Workingtime,
    #   join: u in User, where: u.team == ^user_team and w.start >= ^start_value and w.end <= ^end_value
    # workingtimes = Repo.all(query)

    # Workingtime
    # |> Ecto.Query.preload([user: :team])
    # |> where([w], w.start >= ^start_value and w.end <= ^end_value)
    # |> Repo.all()

    # Repo.all from w in Workingtime,
    # join: u in assoc(w, :user),
    # join: t in assoc(u, :team),
    # where: w.start >= ^start_value and w.end <= ^end_value and t.id == ^user_team,
    # preload: [{:user, :team}]
    Workingtime
    |> where([wt], wt.start >= ^start_value and wt.end <= ^end_value)
    |> join(:left, [wt], user in assoc(wt, :user))
    |> where([wt, user], user.team_id == ^user_team)
    |> join(:left, [wt, user], team in assoc(user, :team))
    |> preload([{:user, :team}])
    #|> where([team], team.id == ^user_team)
    #|> preload([workingtime, user, team], [user: {user, team: user}])
    |> Repo.all()
  end

  alias ToDoAPI.Res.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{source: %Team{}}

  """
  def change_team(%Team{} = team) do
    Team.changeset(team, %{})
  end

  # GUARDIAN SIGN IN TOKEN
  # GUARDIAN SIGN IN TOKEN
  # GUARDIAN SIGN IN TOKEN
  # GUARDIAN SIGN IN TOKEN
  defp get_by_email(email) when is_binary(email) do
    Logger.info("get_by_email")

    case Repo.get_by(User, email: email) do
      nil ->
        Logger.info("dummy")
        dummy_checkpw()

        {:error, "Login error."}

      user ->
        Logger.info(inspect(user))
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    Logger.info("verify_password")

    if checkpw(password, user.password_hash) do
      Logger.info(password)
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
    with {:ok, user} <- get_by_email(email),
         do: verify_password(password, user)
  end

  def token_sign_in(email, password) do
    Logger.info("signin")
    case email_password_auth(email, password) do
      {:ok, user} ->
        Guardian.encode_and_sign(user)

      _ ->
        {:error, :unauthorized}
    end
  end

  # GUARDIAN SIGN IN TOKEN
  # GUARDIAN SIGN IN TOKEN
  # GUARDIAN SIGN IN TOKEN
end
