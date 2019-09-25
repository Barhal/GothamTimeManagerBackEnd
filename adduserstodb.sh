#!/bin/bash

sleep 10

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud1@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud1",
		"role": "admin"
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud2@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud2",
		"role": "manager", 
		"team_id": 1
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud3@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud3",
		"team_id": 1
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud4@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud4",
		"team_id": 1
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud5@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud5",
		"team_id": 1
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud6@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud6",
        "role": "manager",
		"team_id": 2
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud7@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud7",
		"team_id": 2
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud8@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud8",
		"team_id": 2
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud9@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud9",
		"team_id": 2
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud10@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud10",
		"team_id": 2
	}
}
'

curl -X POST \
  http://localhost:4000/log/users \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 175' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4000' \
  -H 'cache-control: no-cache' \
  -d '{
	"user" : {
		"email": "arnaud11@ddddd",
		"password": "password",
		"password_confirmation": "password", 
		"username": "arnaud11",
		"team_id": 2
	}
}
'


mix run priv/repo/seeds/clock_seeds.exs 
mix run priv/repo/seeds/workingtime_seeds.exs