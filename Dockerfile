FROM ruby:2.4
RUN apt-get update && apt-get install apt-transport-https
RUN apt-get update && apt-get install -y build-essential libpq-dev yarn libgmp3-dev
WORKDIR /app
