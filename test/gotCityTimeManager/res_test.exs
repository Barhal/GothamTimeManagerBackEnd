defmodule ToDoAPI.ResTest do
  use ToDoAPI.DataCase

  alias ToDoAPI.Res

  describe "users" do
    alias ToDoAPI.Res.User

    @valid_attrs %{email: "some email", username: "some username"}
    @update_attrs %{email: "some updated email", username: "some updated username"}
    @invalid_attrs %{email: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Res.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Res.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Res.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Res.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Res.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Res.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Res.update_user(user, @invalid_attrs)
      assert user == Res.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Res.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Res.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Res.change_user(user)
    end
  end

  describe "clocks" do
    alias ToDoAPI.Res.Clock

    @valid_attrs %{status: true, time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{status: false, time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{status: nil, time: nil}

    def clock_fixture(attrs \\ %{}) do
      {:ok, clock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Res.create_clock()

      clock
    end

    test "list_clocks/0 returns all clocks" do
      clock = clock_fixture()
      assert Res.list_clocks() == [clock]
    end

    test "get_clock!/1 returns the clock with given id" do
      clock = clock_fixture()
      assert Res.get_clock!(clock.id) == clock
    end

    test "create_clock/1 with valid data creates a clock" do
      assert {:ok, %Clock{} = clock} = Res.create_clock(@valid_attrs)
      assert clock.status == true
      assert clock.time == ~N[2010-04-17 14:00:00]
    end

    test "create_clock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Res.create_clock(@invalid_attrs)
    end

    test "update_clock/2 with valid data updates the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{} = clock} = Res.update_clock(clock, @update_attrs)
      assert clock.status == false
      assert clock.time == ~N[2011-05-18 15:01:01]
    end

    test "update_clock/2 with invalid data returns error changeset" do
      clock = clock_fixture()
      assert {:error, %Ecto.Changeset{}} = Res.update_clock(clock, @invalid_attrs)
      assert clock == Res.get_clock!(clock.id)
    end

    test "delete_clock/1 deletes the clock" do
      clock = clock_fixture()
      assert {:ok, %Clock{}} = Res.delete_clock(clock)
      assert_raise Ecto.NoResultsError, fn -> Res.get_clock!(clock.id) end
    end

    test "change_clock/1 returns a clock changeset" do
      clock = clock_fixture()
      assert %Ecto.Changeset{} = Res.change_clock(clock)
    end
  end

  describe "workingtimes" do
    alias ToDoAPI.Res.Workingtime

    @valid_attrs %{end: ~N[2010-04-17 14:00:00], start: ~N[2010-04-17 14:00:00]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01], start: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{end: nil, start: nil}

    def workingtime_fixture(attrs \\ %{}) do
      {:ok, workingtime} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Res.create_workingtime()

      workingtime
    end

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert Res.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert Res.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      assert {:ok, %Workingtime{} = workingtime} = Res.create_workingtime(@valid_attrs)
      assert workingtime.end == ~N[2010-04-17 14:00:00]
      assert workingtime.start == ~N[2010-04-17 14:00:00]
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Res.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{} = workingtime} = Res.update_workingtime(workingtime, @update_attrs)
      assert workingtime.end == ~N[2011-05-18 15:01:01]
      assert workingtime.start == ~N[2011-05-18 15:01:01]
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = Res.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == Res.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = Res.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> Res.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = Res.change_workingtime(workingtime)
    end
  end
end
