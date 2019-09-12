defmodule ToDoAPI.Res do
  @moduledoc """
  The Res context.
  """

  import Ecto.Query, warn: false
  alias ToDoAPI.Repo

  alias ToDoAPI.Res.User
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
  #Voir doc -> https://hexdocs.pm/ecto/Ecto.Repo.html#c:get_by/3
  def get_user_email_username(email, username), do: Repo.get_by(User, [username: username, email: email])

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

  alias ToDoAPI.Res.Workingtime

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
  def get_workingtime_userid_workingtime_id(user_id, workingtime_id), do: Repo.get_by(Workingtime, [user: user_id, id: workingtime_id])

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
    #|> Ecto.Query.preload([:user])
    |> where([w], w.user == ^user_id and w.start >= ^start_value and w.end <= ^end_value)
    |> Repo.all()
  end

  #def get_multiple_workingtimes(attrs \\ %{}) do
  #  Logger.info("HAHA")
  #  Logger.info(inspect(attrs))
  #  Logger.info("hahah")
  #  Logger.info(inspect(attrs["start"]))
  #  Logger.info(inspect(attrs["user_id"]))
  #  Repo.all(from(w in Workingtime, where: w.start >= ^attrs["start"] and w.end <= ^attrs["end"] and w.user == ^attrs["user_id"],
  #    select: %{start: w.start, user: w.user, end: w.end, id: w.id}))
  #end

  #def get_workingtimes(attrs \\ %{}) do
  #  Logger.info(inspect(attrs))
  #  Repo.all(from(w in Workingtime, where: w.id == ^attrs["workingtime_id"] and w.user == ^attrs["user_id"],
  #    select: %{start: w.start, user: w.user, end: w.end, id: w.id}))
  #end


  #Repo.all(from(w in Workingtime, join: u in User, on: u.id == w.user, where: w.start == ^sstart and w.end == ^eend, select:
    #%{start: w.start, user_id: w.user, end: w.end, id: w.id, username: u.username, email: u.email}))
  def create_workingtimeWithUserId(attrs \\ %{}) do
    Logger.info(inspect(attrs), pretty: true)
    Logger.info(inspect(%Workingtime{}), pretty: true)
    changeset = Workingtime.changeset(%Workingtime{}, %{user: attrs["user_id"], end: attrs["workingtime"]["end"], start: attrs["workingtime"]["start"]})
    #Logger.info(changeset)
    Repo.insert(changeset)
    #%Workingtime{}
    #|> Workingtime.changeset(attrs)
    #|> Repo.insert()
  end
  def get_clocksAllForUser(attrs \\ %{}) do
    Logger.info(inspect(attrs), pretty: true)
    Repo.all(from(c in Clock, where: c.user == ^attrs["user_id"]))
      ##select: %{start: c.time, user: c.user, status: c.status, id: c.id}))
  end
  def get_clocksLastTimeFromUser(attrs \\ %{}) do
    Logger.info("ha")
    Logger.info(inspect(attrs), pretty: true)
    Repo.one(from c in Clock, order_by: [desc: c.time], where: c.user == ^attrs["user_id"], select: c, limit: 1)
  end
  @spec post_clocksCreate(nil | keyword | map) :: :ok | {:error, any}
  def post_clocksCreate(attrs \\ %{}) do
    #Logger.info(inspect(attrs), pretty: true)
    #_x = Res.get_clocksLastTimeFromUser(attrs \\ %{})
    last_clock = Repo.one(from c in Clock, order_by: [desc: c.time], where: c.user == ^attrs["user_id"], select: c, limit: 1)
    Logger.info("here")
    Logger.info(inspect(attrs), pretty: true)
    Logger.info(inspect(last_clock.id))
    Logger.info(inspect(last_clock))
    new_status = !last_clock.status
    Logger.info("status last_clock #{inspect(last_clock.status)}")
    Logger.info("status new #{inspect(new_status)}")
    #Logger.info(inspect(attrs["clock"]["time"]))
    Logger.info("there1")
    {_, naive_datetime} = NaiveDateTime.from_iso8601(attrs["clock"]["time"])
    {userid, _} = Integer.parse(attrs["user_id"])
    Logger.info(inspect(naive_datetime))
    Logger.info("there2")
    c = %Clock{user: userid, status: new_status, time: naive_datetime}
    Logger.info("clockObject is : #{inspect(c)}")
    Logger.info("there")
    Repo.insert(c)
    #Logger.info(inspect(ff))
  end
  #Repo.one(from c in Clock, order_by: [desc: c.time], where: c.user == ^0, select: c, limit: 1)
  #field :status, :boolean, default: false
  #field :time, :naive_datetime
  #field :user, :id
end

