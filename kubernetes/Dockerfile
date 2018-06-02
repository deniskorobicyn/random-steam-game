FROM ruby:2.5

RUN mkdir -p /src/app
WORKDIR /src/app

RUN apt-get update && apt-get install -y nodejs mysql-client postgresql-client sqlite3 vim --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

COPY Gemfile /src/app/
COPY Gemfile.lock /src/app/
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . /src/app
RUN bundle exec rake assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]