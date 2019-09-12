# mix run priv/repo/seeds/workingtime_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.Workingtime
#NaiveDateTime.from_iso8601(attrs["clock"]["time"])
#UserOne
{_, start1_1} = NaiveDateTime.from_iso8601("2015-02-21 06:00:00")
{_, end1_1} = NaiveDateTime.from_iso8601("2020-02-21 12:00:00")
{_, start1_2} = NaiveDateTime.from_iso8601("2015-02-21 13:00:00")
{_, end1_2} = NaiveDateTime.from_iso8601("2020-02-21 15:00:00")
{_, start1_3} = NaiveDateTime.from_iso8601("2015-02-21 15:15:00")
{_, end1_3} = NaiveDateTime.from_iso8601("2020-02-21 17:30:00")
Repo.insert! %Workingtime{
  start: start1_1,
  end: end1_1,
  user: 1
}
Repo.insert! %Workingtime{
  start: start1_2,
  end: end1_2,
  user: 1
}
Repo.insert! %Workingtime{
  start: start1_3,
  end: end1_3,
  user: 1
}
#UserTwo
{_, start2_1} = NaiveDateTime.from_iso8601("2018-02-21 08:30:00")
{_, end2_1} = NaiveDateTime.from_iso8601("2020-02-21 13:00:00")
{_, start2_2} = NaiveDateTime.from_iso8601("2018-02-21 14:30:00")
{_, end2_2} = NaiveDateTime.from_iso8601("2020-02-21 18:00:00")
{_, start2_3} = NaiveDateTime.from_iso8601("2018-02-21 18:15:00")
{_, end2_3} = NaiveDateTime.from_iso8601("2020-02-21 19:30:30")
Repo.insert! %Workingtime{
  start: start2_1,
  end: end2_1,
  user: 2
}
Repo.insert! %Workingtime{
  start: start2_2,
  end: end2_2,
  user: 2
}
Repo.insert! %Workingtime{
  start: start2_3,
  end: end2_3,
  user: 2
}
#UserThree
{_, start3_1} = NaiveDateTime.from_iso8601("2005-02-21 09:00:00")
{_, end3_1} = NaiveDateTime.from_iso8601("2025-02-21 13:00:00")
{_, start3_2} = NaiveDateTime.from_iso8601("2005-02-21 14:00:00")
{_, end3_2} = NaiveDateTime.from_iso8601("2025-02-21 17:00:00")
Repo.insert! %Workingtime{
  start: start3_1,
  end: end3_1,
  user: 3
}
Repo.insert! %Workingtime{
  start: start3_2,
  end: end3_2,
  user: 3
}

