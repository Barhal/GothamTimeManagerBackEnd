FROM elixir:1.8.2-otp-22

RUN apt-get update && \
  apt-get install -y postgresql-client

RUN mkdir /gotcitytimemanager
COPY . /gotcitytimemanager
WORKDIR /gotcitytimemanager

#RUN cd /gotcitytimemanager; \
RUN mix local.hex --force; 
RUN mix local.rebar --force; 
RUN mix deps.get --only prod

RUN mix compile

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]