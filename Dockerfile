FROM ruby:2.5.0-stretch

COPY ./Gemfile ./application/
COPY ./Gemfile.lock ./application/

WORKDIR /application

ENV BUNDLER_VERSION 2.0.1

RUN gem install bundler -v '2.0.1' 
RUN bundle install --deployment --without development test 
RUN apt-get update -qq && apt-get install -y build-essential 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - 
RUN apt-get install -y nodejs 

RUN npm install yarn -g

COPY . .

ENV RAILS_ENV production

RUN bundle exec rake assets:precompile

CMD bundle exec rails server