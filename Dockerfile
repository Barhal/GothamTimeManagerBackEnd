FROM elixir:1.8.2-otp-22

RUN apt-get update && \
  apt-get install -y postgresql-client

RUN mkdir /gotcitytimemanager
COPY . /gotcitytimemanager
WORKDIR /gotcitytimemanager

ENV DB_HOST db
ENV DB_USER postgres
ENV DB_PASSWORD postgres
ENV DB_NAME gotcitytimemanager_dev
ENV DB_PORT 5432

#RUN cd /gotcitytimemanager; \
RUN mix local.hex --force; \
    mix local.rebar --force; \
    mix deps.get --only prod

RUN mix compile

RUN apt-get update && apt-get install -y dos2unix

COPY ./entrypoint.sh /entrypoint.sh
# COPY ./adduserstodb.sh /adduserstodb.sh

RUN dos2unix /entrypoint.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*

#COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]