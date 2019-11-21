FROM ruby:2.6-slim
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    nodejs \
    ssh \
    libpq-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN echo 'gem: --no-rdoc --no-ri --no-document' > /root/.gemrc \
  && ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts \
  && gem update --system 2.6.12 \
  && gem install bundler --version 2.0.2

WORKDIR /app
