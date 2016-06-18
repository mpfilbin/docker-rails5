FROM ubuntu:16.04
MAINTAINER Michae Filbin <michael.filbin@gmail.com>
LABEL version="1.0-pre" \
      description="Basic Rails 5 Application Server"

RUN apt-get update; \
    apt-get install -y git-core \
    wget \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    python-software-properties \
    libffi-dev

RUN cd /tmp; \
    wget http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz; \
    tar -xzvf ruby-2.3.1.tar.gz; \
    cd ruby-2.3.1/; \
    ./configure; \
    make; \
    make install

RUN gem install bundler; \
    gem install rails --pre

RUN useradd -lr railssa