FROM ruby:2.4
RUN apt-get update && apt-get install apt-transport-https
RUN apt-get update && apt-get install -y build-essential nodejs libpq-dev libgmp3-dev
WORKDIR /app
