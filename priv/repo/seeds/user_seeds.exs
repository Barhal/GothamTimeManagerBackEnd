# mix run priv/repo/seeds/user_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.User

changeset = User.changeset(%User{}, %{username: "FakeUserOne", email: "fakeone@discord.com", password: "password", password_confirmation: "password", role: "admin"})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserTwo", email: "faketwo@discord.com", password: "password", password_confirmation: "password", role: "manager", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserThree", email: "fakethree@discord.com", password: "password", password_confirmation: "password", role: "employee", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "Niavart", email: "antoine.renaud@discord.com", password: "password", password_confirmation: "password", role: "employee", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "Pocooo", email: "christophe.cast@epitech.com", password: "password", password_confirmation: "password", role: "employee", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "Davidvera", email: "david.vera@hotmail.com", password: "password", password_confirmation: "password", role: "employee", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "Barhal", email: "arnaud.heymans@gmail.com", password: "password", password_confirmation: "password", role: "employee", team_id: 1})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserFour", email: "fakefour@discord.com", password: "password", password_confirmation: "password", role: "manager", team_id: 2})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserFive", email: "fakefive@discord.com", password: "password", password_confirmation: "password", role: "employee", team_id: 2})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserSix", email: "fakesix@discord.com", password: "password", password_confirmation: "password", role: "employee", team_id: 2})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserSeven", email: "fakeseven@discord.com", password: "password", password_confirmation: "password", role: "employee", team_id: 2})
Repo.insert!(changeset)

changeset = User.changeset(%User{}, %{username: "FakeUserEight", email: "fakeeight@discord.com", password: "password", password_confirmation: "password", role: "employee"})
Repo.insert!(changeset)
