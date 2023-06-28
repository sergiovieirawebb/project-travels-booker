FROM debian:buster-slim

RUN apt-get -y update; apt-get -y install curl; apt-get -y install git

RUN curl -fsSL https://crystal-lang.org/install.sh | bash -s -- --channel=nightly

WORKDIR /app

COPY . .

CMD shards install; crystal sam.cr db:setup; crystal run src/main.cr
