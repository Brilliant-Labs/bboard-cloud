FROM ruby:2.6
RUN apt-get update && apt-get upgrade -y
WORKDIR /app/
RUN git clone https://github.com/yuzhangiot/thingspeak.git
WORKDIR /app/thingspeak/
#RUN gem install ZenTest -v '4.11.0' --source 'http://rubygems.org/'
RUN bundle install
####db example
###ADD database.yml.example config/database.yml
###
###EXPOSE 80
###
###CMD bundle exec rails server -p 80
