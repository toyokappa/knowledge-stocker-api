FROM ruby:2.5.3

ENV APP_ROOT=/usr/src/app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN echo "deb http://deb.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y build-essential mysql-client --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN gem update --system
RUN bundle install --system # --without development test

ADD . $APP_ROOT

EXPOSE 3000
