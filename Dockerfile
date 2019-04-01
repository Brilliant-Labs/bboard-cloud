FROM ruby:2.1

MAINTAINER Kai Heikka <synomi66@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
#RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential libpq-dev git

WORKDIR /app/

#thingspeak setup
RUN git clone https://github.com/Brilliant-Labs/bboard-cloud.git
WORKDIR /app/bboard-cloud/thingspeak
RUN gem install tzinfo-data -v 1.2013.8
RUN bundle install

#db example
ADD database.yml.example config/database.yml

EXPOSE 80

CMD bundle exec rails server -p 80
