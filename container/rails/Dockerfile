FROM ruby:2.5.3

ENV APP_ROOT=/usr/src/app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y mysql-client --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN gem update --system
RUN gem uninstall bundler
RUN rm -f /usr/local/bin/bundle
RUN rm -f /usr/local/bin/bundler
RUN gem install bundler
RUN bundle install --system # --without development test

ADD . $APP_ROOT

EXPOSE 3000
