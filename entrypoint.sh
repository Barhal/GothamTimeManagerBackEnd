#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
# while ! pg_isready -q -h ${PGHOST} -p ${PGPORT} -U ${PGUSER}
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

# # Create, migrate, and seed database if it doesn't exist.
# if [[ -z `psql -Atqc "\\list ${PGDATABASE}"` ]]; then
#   echo "Database ${PGDATABASE} does not exist. Creating..."
#   createdb -E UTF8 ${PGDATABASE} -l en_US.UTF-8 -T template0
#   mix ecto.migrate
#   mix run priv/repo/seeds.exs
#   echo "Database ${PGDATABASE} created."
# fi
# cd /gotcitytimemanager

# MIX_ENV=prod mix ecto.migrate \ 
# mix run priv/repo/seeds/clock_seeds.exs \
# mix run priv/repo/seeds/user_seeds.exs \
# mix run priv/repo/seeds/workingtime_seeds.exs

# PORT=80 MIX_ENV=prod mix phx.server

while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds/team_seeds.exs

  echo "Database $PGDATABASE created."
fi

exec mix phx.server & ./adduserstodb.sh