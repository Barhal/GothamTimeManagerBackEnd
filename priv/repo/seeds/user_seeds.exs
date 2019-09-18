# mix run priv/repo/seeds/user_seeds.exs
alias ToDoAPI.Repo
alias ToDoAPI.Res.User

Repo.insert! %User{username: "Niavart", email: "antoine.renaud@discord.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "Pocooo", email: "christophe.cast@epitech.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "Davidvera", email: "david.vera@hotmail.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "Barhal", email: "arnaud.heymans@gmail.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "FakeUserOne", email: "fakeone@discord.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "FakeUserTwo", email: "faketwo@discord.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
Repo.insert! %User{username: "FakeUserThree", email: "fakethree@discord.com", password_hash: "$2b$12$rzVPFBRaUcY3VOXVearxdeCnA0O1cWtJTnLSqnZdEfjSVyS3SLW.C"}
