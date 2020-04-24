FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs  \
                       yarn

RUN mkdir /webapp

ENV APP_ROOT /webapp
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
ADD ./yarn.lock $APP_ROOT/yarn.lock

RUN gem install bundler
RUN bundle install
RUN NODE_ENV=development yarn install

ADD . $APP_ROOT