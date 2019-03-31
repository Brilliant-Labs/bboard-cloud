FROM ruby:2.1

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app/

#thingspeak setup
#RUN git clone https://github.com/yuzhangiot/thingspeak.git
WORKDIR /app/thingspeak/
RUN bundle install

#db example
ADD database.yml.example config/database.yml

EXPOSE 80

CMD bundle exec rails server -p 80
