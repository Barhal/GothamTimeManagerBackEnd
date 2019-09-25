# mix run priv/repo/seeds/workingtime_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.Workingtime
# NaiveDateTime.from_iso8601(attrs["clock"]["time"])
# user_idOne
{_, time1_1_1} = NaiveDateTime.from_iso8601("2019-09-21 06:05:00")
{_, time1_2_1} = NaiveDateTime.from_iso8601("2019-09-21 12:10:00")
{_, time1_3_1} = NaiveDateTime.from_iso8601("2019-09-21 12:58:00")
{_, time1_4_1} = NaiveDateTime.from_iso8601("2019-09-21 15:03:00")
{_, time1_5_1} = NaiveDateTime.from_iso8601("2019-09-21 15:16:00")
{_, time1_6_1} = NaiveDateTime.from_iso8601("2019-09-21 17:42:00")
{_, time1_1_2} = NaiveDateTime.from_iso8601("2019-09-22 05:51:00")
{_, time1_2_2} = NaiveDateTime.from_iso8601("2019-09-22 12:08:00")
{_, time1_3_2} = NaiveDateTime.from_iso8601("2019-09-22 13:05:00")
{_, time1_4_2} = NaiveDateTime.from_iso8601("2019-09-22 15:07:00")
{_, time1_5_2} = NaiveDateTime.from_iso8601("2019-09-22 15:13:00")
{_, time1_6_2} = NaiveDateTime.from_iso8601("2019-09-22 17:32:00")
# Day one
Repo.insert!(%Workingtime{
  start: time1_1_1,
  end: time1_2_1,
  user_id: 1
})

Repo.insert!(%Workingtime{
  start: time1_3_1,
  end: time1_4_1,
  user_id: 1
})

Repo.insert!(%Workingtime{
  start: time1_5_1,
  end: time1_6_1,
  user_id: 1
})

# Day two
Repo.insert!(%Workingtime{
  start: time1_1_2,
  end: time1_2_2,
  user_id: 1
})

Repo.insert!(%Workingtime{
  start: time1_3_2,
  end: time1_4_2,
  user_id: 1
})

Repo.insert!(%Workingtime{
  start: time1_5_2,
  end: time1_6_2,
  user_id: 1
})

# user_idTwo
{_, time2_1_1} = NaiveDateTime.from_iso8601("2019-09-21 08:25:00")
{_, time2_2_1} = NaiveDateTime.from_iso8601("2019-09-21 13:12:00")
{_, time2_3_1} = NaiveDateTime.from_iso8601("2019-09-21 14:25:00")
{_, time2_4_1} = NaiveDateTime.from_iso8601("2019-09-21 18:05:00")
{_, time2_5_1} = NaiveDateTime.from_iso8601("2019-09-21 18:18:00")
{_, time2_6_1} = NaiveDateTime.from_iso8601("2019-09-21 19:45:00")
{_, time2_1_2} = NaiveDateTime.from_iso8601("2019-09-22 08:42:00")
{_, time2_2_2} = NaiveDateTime.from_iso8601("2019-09-22 13:26:00")
{_, time2_3_2} = NaiveDateTime.from_iso8601("2019-09-22 14:32:00")
{_, time2_4_2} = NaiveDateTime.from_iso8601("2019-09-22 17:56:58")
{_, time2_5_2} = NaiveDateTime.from_iso8601("2019-09-22 18:13:34")
{_, time2_6_2} = NaiveDateTime.from_iso8601("2019-09-22 19:52:00")
# Day one
Repo.insert!(%Workingtime{
  start: time2_1_1,
  end: time2_2_1,
  user_id: 2
})

Repo.insert!(%Workingtime{
  start: time2_3_1,
  end: time2_4_1,
  user_id: 2
})

Repo.insert!(%Workingtime{
  start: time2_5_1,
  end: time2_6_1,
  user_id: 2
})

# Day two
Repo.insert!(%Workingtime{
  start: time2_1_2,
  end: time2_2_2,
  user_id: 2
})

Repo.insert!(%Workingtime{
  start: time2_3_2,
  end: time2_4_2,
  user_id: 2
})

Repo.insert!(%Workingtime{
  start: time2_5_2,
  end: time2_6_2,
  user_id: 2
})

# user_idThree
{_, time3_1_1} = NaiveDateTime.from_iso8601("2019-09-21 09:12:00")
{_, time3_2_1} = NaiveDateTime.from_iso8601("2019-09-21 13:02:00")
{_, time3_3_1} = NaiveDateTime.from_iso8601("2019-09-21 13:57:45")
{_, time3_4_1} = NaiveDateTime.from_iso8601("2019-09-21 17:16:00")
{_, time3_1_2} = NaiveDateTime.from_iso8601("2019-09-22 08:58:00")
{_, time3_2_2} = NaiveDateTime.from_iso8601("2019-09-22 12:42:00")
{_, time3_3_2} = NaiveDateTime.from_iso8601("2019-09-22 14:14:00")
{_, time3_4_2} = NaiveDateTime.from_iso8601("2019-09-22 17:43:58")
# Day one
Repo.insert!(%Workingtime{
  start: time3_1_1,
  end: time3_2_1,
  user_id: 3
})

Repo.insert!(%Workingtime{
  start: time3_3_1,
  end: time3_4_1,
  user_id: 3
})

# Day two
Repo.insert!(%Workingtime{
  start: time3_1_2,
  end: time3_2_2,
  user_id: 3
})

Repo.insert!(%Workingtime{
  start: time3_3_2,
  end: time3_4_2,
  user_id: 3
})

# user_idFour
{_, time4_1_1} = NaiveDateTime.from_iso8601("2019-09-21 09:12:00")
{_, time4_2_1} = NaiveDateTime.from_iso8601("2019-09-21 13:02:00")
{_, time4_3_1} = NaiveDateTime.from_iso8601("2019-09-21 13:57:45")
{_, time4_4_1} = NaiveDateTime.from_iso8601("2019-09-21 17:16:00")
{_, time4_1_2} = NaiveDateTime.from_iso8601("2019-09-22 08:58:00")
{_, time4_2_2} = NaiveDateTime.from_iso8601("2019-09-22 12:42:00")
{_, time4_3_2} = NaiveDateTime.from_iso8601("2019-09-22 14:14:00")
{_, time4_4_2} = NaiveDateTime.from_iso8601("2019-09-22 17:43:58")
# Day one
Repo.insert!(%Workingtime{
  start: time4_1_1,
  end: time4_2_1,
  user_id: 4
})

Repo.insert!(%Workingtime{
  start: time4_3_1,
  end: time4_4_1,
  user_id: 4
})

# Day two
Repo.insert!(%Workingtime{
  start: time4_1_2,
  end: time4_2_2,
  user_id: 4
})

Repo.insert!(%Workingtime{
  start: time4_3_2,
  end: time4_4_2,
  user_id: 4
})

# user_idFive
{_, time5_1_1} = NaiveDateTime.from_iso8601("2019-09-21 01:25:00")
{_, time5_2_1} = NaiveDateTime.from_iso8601("2019-09-21 06:12:00")
{_, time5_3_1} = NaiveDateTime.from_iso8601("2019-09-21 06:25:00")
{_, time5_4_1} = NaiveDateTime.from_iso8601("2019-09-21 10:05:00")
{_, time5_5_1} = NaiveDateTime.from_iso8601("2019-09-21 10:18:00")
{_, time5_6_1} = NaiveDateTime.from_iso8601("2019-09-21 12:45:00")
{_, time5_1_2} = NaiveDateTime.from_iso8601("2019-09-22 00:42:00")
{_, time5_2_2} = NaiveDateTime.from_iso8601("2019-09-22 05:26:00")
{_, time5_3_2} = NaiveDateTime.from_iso8601("2019-09-22 05:32:00")
{_, time5_4_2} = NaiveDateTime.from_iso8601("2019-09-22 08:56:58")
{_, time5_5_2} = NaiveDateTime.from_iso8601("2019-09-22 09:13:34")
{_, time5_6_2} = NaiveDateTime.from_iso8601("2019-09-22 11:52:00")
# Day one
Repo.insert!(%Workingtime{
  start: time5_1_1,
  end: time5_2_1,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time5_3_1,
  end: time5_4_1,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time5_5_1,
  end: time5_6_1,
  user_id: 5
})

# Day two
Repo.insert!(%Workingtime{
  start: time5_1_2,
  end: time5_2_2,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time5_3_2,
  end: time5_4_2,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time5_5_2,
  end: time5_6_2,
  user_id: 5
})

# user_idSix
{_, time6_1_1} = NaiveDateTime.from_iso8601("2019-09-21 13:12:00")
{_, time6_2_1} = NaiveDateTime.from_iso8601("2019-09-21 17:02:00")
{_, time6_3_1} = NaiveDateTime.from_iso8601("2019-09-21 17:57:45")
{_, time6_4_1} = NaiveDateTime.from_iso8601("2019-09-21 22:16:00")
{_, time6_1_2} = NaiveDateTime.from_iso8601("2019-09-22 14:58:00")
{_, time6_2_2} = NaiveDateTime.from_iso8601("2019-09-22 19:42:00")
{_, time6_3_2} = NaiveDateTime.from_iso8601("2019-09-22 20:14:00")
{_, time6_4_2} = NaiveDateTime.from_iso8601("2019-09-22 22:43:58")
# Day one
Repo.insert!(%Workingtime{
  start: time6_1_1,
  end: time6_2_1,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time6_3_1,
  end: time6_4_1,
  user_id: 5
})

# Day two
Repo.insert!(%Workingtime{
  start: time6_1_2,
  end: time6_2_2,
  user_id: 5
})

Repo.insert!(%Workingtime{
  start: time6_3_2,
  end: time6_4_2,
  user_id: 5
})
