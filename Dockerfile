FROM ruby:2.4
RUN apt-get update && apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN wget -qO- https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y build-essential libpq-dev yarn libgmp3-dev
WORKDIR /app
