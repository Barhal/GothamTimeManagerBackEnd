# mix run priv/repo/seeds/user_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.User

Repo.insert! %User{username: "Niavart", email: "antoine.renaud@discord.com"}
Repo.insert! %User{username: "Pocooo", email: "christophe.cast@epitech.com"}
Repo.insert! %User{username: "Davidvera", email: "david.vera@hotmail.com"}
Repo.insert! %User{username: "Barhal", email: "arnaud.heymans@gmail.com"}
Repo.insert! %User{username: "FakeUserOne", email: "fakeone@discord.com"}
Repo.insert! %User{username: "FakeUserTwo", email: "faketwo@discord.com"}
Repo.insert! %User{username: "FakeUserThree", email: "fakethree@discord.com"}
