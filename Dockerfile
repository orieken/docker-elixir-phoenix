FROM ubuntu:trusty

ENV TERM linux
ENV DEBIAN_FRONTEND=noninteractive

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -q
RUN apt-get autoremove

RUN apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb

RUN apt-get update -q && \
    apt-get install -y elixir

RUN elixir -v

RUN mix local.hex

RUN mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez

RUN apt-get install -y nodejs-legacy
RUN apt-get install -y inotify-tools