FROM elixir:1.8.2-otp-22

ENV DATABASE_URL=ecto://postgres:postgres@database/database
ENV SECRET_KEY_BASE=68UTh5kzw+ooFPLtGC28dKm3WrQprmacngXAMIdt0XkntYQiTAQFaqcNbtqoA60+

COPY . /hello

RUN cd /hello; \
    mix local.hex --force; \
    mix local.rebar --force; \
    mix deps.get --only prod

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]