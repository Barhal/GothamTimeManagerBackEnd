# mix run priv/repo/seeds/team_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.Team

Repo.insert! %Team{name: "Tigrou"}
Repo.insert! %Team{name: "Hyppo"}
Repo.insert! %Team{name: "Lion"}
