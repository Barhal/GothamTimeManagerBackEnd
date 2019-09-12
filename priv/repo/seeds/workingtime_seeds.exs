# mix run priv/repo/seeds/workingtime_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.Workingtime
#NaiveDateTime.from_iso8601(attrs["clock"]["time"])
#UserOne
{_, time1_1_1} = NaiveDateTime.from_iso8601("2019-02-21 06:05:00")
{_, time1_2_1} = NaiveDateTime.from_iso8601("2019-02-21 12:10:00")
{_, time1_3_1} = NaiveDateTime.from_iso8601("2019-02-21 12:58:00")
{_, time1_4_1} = NaiveDateTime.from_iso8601("2019-02-21 15:03:00")
{_, time1_5_1} = NaiveDateTime.from_iso8601("2019-02-21 15:16:00")
{_, time1_6_1} = NaiveDateTime.from_iso8601("2019-02-21 17:42:00")
{_, time1_1_2} = NaiveDateTime.from_iso8601("2019-02-22 05:51:00")
{_, time1_2_2} = NaiveDateTime.from_iso8601("2019-02-22 12:08:00")
{_, time1_3_2} = NaiveDateTime.from_iso8601("2019-02-22 13:05:00")
{_, time1_4_2} = NaiveDateTime.from_iso8601("2019-02-22 15:07:00")
{_, time1_5_2} = NaiveDateTime.from_iso8601("2019-02-22 15:13:00")
{_, time1_6_2} = NaiveDateTime.from_iso8601("2019-02-22 17:32:00")
#Day one
Repo.insert! %Workingtime{
  start: time1_1_1,
  end: time1_2_1,
  user: 1
}
Repo.insert! %Workingtime{
  start: time1_3_1,
  end: time1_4_1,
  user: 1
}
Repo.insert! %Workingtime{
  start: time1_5_1,
  end: time1_6_1,
  user: 1
}
#Day two
Repo.insert! %Workingtime{
  start: time1_1_2,
  end: time1_2_2,
  user: 1
}
Repo.insert! %Workingtime{
  start: time1_3_2,
  end: time1_4_2,
  user: 1
}
Repo.insert! %Workingtime{
  start: time1_5_2,
  end: time1_6_2,
  user: 1
}
#UserTwo
{_, time2_1_1} = NaiveDateTime.from_iso8601("2019-02-21 08:25:00")
{_, time2_2_1} = NaiveDateTime.from_iso8601("2019-02-21 13:12:00")
{_, time2_3_1} = NaiveDateTime.from_iso8601("2019-02-21 14:25:00")
{_, time2_4_1} = NaiveDateTime.from_iso8601("2019-02-21 18:05:00")
{_, time2_5_1} = NaiveDateTime.from_iso8601("2019-02-21 18:18:00")
{_, time2_6_1} = NaiveDateTime.from_iso8601("2019-02-21 19:45:00")
{_, time2_1_2} = NaiveDateTime.from_iso8601("2019-02-22 08:42:00")
{_, time2_2_2} = NaiveDateTime.from_iso8601("2019-02-22 13:26:00")
{_, time2_3_2} = NaiveDateTime.from_iso8601("2019-02-22 14:32:00")
{_, time2_4_2} = NaiveDateTime.from_iso8601("2019-02-22 17:56:58")
{_, time2_5_2} = NaiveDateTime.from_iso8601("2019-02-22 18:13:34")
{_, time2_6_2} = NaiveDateTime.from_iso8601("2019-02-22 19:52:00")
#Day one
Repo.insert! %Workingtime{
  start: time2_1_1,
  end: time2_2_1,
  user: 2
}
Repo.insert! %Workingtime{
  start: time2_3_1,
  end: time2_4_1,
  user: 2
}
Repo.insert! %Workingtime{
  start: time2_5_1,
  end: time2_6_1,
  user: 2
}
#Day two
Repo.insert! %Workingtime{
  start: time2_1_2,
  end: time2_2_2,
  user: 2
}
Repo.insert! %Workingtime{
  start: time2_3_2,
  end: time2_4_2,
  user: 2
}
Repo.insert! %Workingtime{
  start: time2_5_2,
  end: time2_6_2,
  user: 2
}
#UserThree
{_, time3_1_1} = NaiveDateTime.from_iso8601("2019-02-21 09:12:00")
{_, time3_2_1} = NaiveDateTime.from_iso8601("2019-02-21 13:02:00")
{_, time3_3_1} = NaiveDateTime.from_iso8601("2019-02-21 13:57:45")
{_, time3_4_1} = NaiveDateTime.from_iso8601("2019-02-21 17:16:00")
{_, time3_1_2} = NaiveDateTime.from_iso8601("2019-02-22 08:58:00")
{_, time3_2_2} = NaiveDateTime.from_iso8601("2019-02-22 12:42:00")
{_, time3_3_2} = NaiveDateTime.from_iso8601("2019-02-22 14:14:00")
{_, time3_4_2} = NaiveDateTime.from_iso8601("2019-02-22 17:43:58")
#Day one
Repo.insert! %Workingtime{
  start: time3_1_1,
  end: time3_2_1,
  user: 3
}
Repo.insert! %Workingtime{
  start: time3_3_1,
  end: time3_4_1,
  user: 3
}
#Day two
Repo.insert! %Workingtime{
  start: time3_1_2,
  end: time3_2_2,
  user: 3
}
Repo.insert! %Workingtime{
  start: time3_3_2,
  end: time3_4_2,
  user: 3
}

