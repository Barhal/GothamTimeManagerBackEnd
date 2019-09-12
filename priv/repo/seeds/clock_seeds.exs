# mix run priv/repo/seeds/clock_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.Clock

#UserOne - DayOne 2019-02-21
{_, time1_1_1} = NaiveDateTime.from_iso8601("2019-02-21 06:05:00")
{_, time1_2_1} = NaiveDateTime.from_iso8601("2019-02-21 12:10:00")
{_, time1_3_1} = NaiveDateTime.from_iso8601("2019-02-21 12:58:00")
{_, time1_4_1} = NaiveDateTime.from_iso8601("2019-02-21 15:03:00")
{_, time1_5_1} = NaiveDateTime.from_iso8601("2019-02-21 15:16:00")
{_, time1_6_1} = NaiveDateTime.from_iso8601("2019-02-21 17:42:00")
Repo.insert! %Clock {
  time: time1_1_1,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_2_1,
  status: false,
  user: 1
}
Repo.insert! %Clock {
  time: time1_3_1,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_4_1,
  status: false,
  user: 1
}
Repo.insert! %Clock {
  time: time1_5_1,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_6_1,
  status: false,
  user: 1
}
#UserOne - DayTwo 2019-02-22
{_, time1_1_2} = NaiveDateTime.from_iso8601("2019-02-22 05:51:00")
{_, time1_2_2} = NaiveDateTime.from_iso8601("2019-02-22 12:08:00")
{_, time1_3_2} = NaiveDateTime.from_iso8601("2019-02-22 13:05:00")
{_, time1_4_2} = NaiveDateTime.from_iso8601("2019-02-22 15:07:00")
{_, time1_5_2} = NaiveDateTime.from_iso8601("2019-02-22 15:13:00")
{_, time1_6_2} = NaiveDateTime.from_iso8601("2019-02-22 17:32:00")
Repo.insert! %Clock {
  time: time1_1_2,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_2_2,
  status: false,
  user: 1
}
Repo.insert! %Clock {
  time: time1_3_2,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_4_2,
  status: false,
  user: 1
}
Repo.insert! %Clock {
  time: time1_5_2,
  status: true,
  user: 1
}
Repo.insert! %Clock {
  time: time1_6_2,
  status: false,
  user: 1
}
#UserTwo - DayOne 2019-02-21
{_, time2_1_1} = NaiveDateTime.from_iso8601("2019-02-21 08:25:00")
{_, time2_2_1} = NaiveDateTime.from_iso8601("2019-02-21 13:12:00")
{_, time2_3_1} = NaiveDateTime.from_iso8601("2019-02-21 14:25:00")
{_, time2_4_1} = NaiveDateTime.from_iso8601("2019-02-21 18:05:00")
{_, time2_5_1} = NaiveDateTime.from_iso8601("2019-02-21 18:18:00")
{_, time2_6_1} = NaiveDateTime.from_iso8601("2019-02-21 19:45:00")
Repo.insert! %Clock {
  time: time2_1_1,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_2_1,
  status: false,
  user: 2
}
Repo.insert! %Clock {
  time: time2_3_1,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_4_1,
  status: false,
  user: 2
}
Repo.insert! %Clock {
  time: time2_5_1,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_6_1,
  status: false,
  user: 2
}
#UserTwo - DayTwo 2019-02-22
{_, time2_1_2} = NaiveDateTime.from_iso8601("2019-02-22 08:42:00")
{_, time2_2_2} = NaiveDateTime.from_iso8601("2019-02-22 13:26:00")
{_, time2_3_2} = NaiveDateTime.from_iso8601("2019-02-22 14:32:00")
{_, time2_4_2} = NaiveDateTime.from_iso8601("2019-02-22 17:56:58")
{_, time2_5_2} = NaiveDateTime.from_iso8601("2019-02-22 18:13:34")
{_, time2_6_2} = NaiveDateTime.from_iso8601("2019-02-22 19:52:00")
Repo.insert! %Clock {
  time: time2_1_2,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_2_2,
  status: false,
  user: 2
}
Repo.insert! %Clock {
  time: time2_3_2,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_4_2,
  status: false,
  user: 2
}
Repo.insert! %Clock {
  time: time2_5_2,
  status: true,
  user: 2
}
Repo.insert! %Clock {
  time: time2_6_2,
  status: false,
  user: 2
}
