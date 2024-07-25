FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq \
&& apt-get install -y ca-certificates curl gnupg \
&& mkdir -p /etc/apt/keyrings \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
&& NODE_MAJOR=18 \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libpq-dev libssl-dev nodejs yarn python3 cron
RUN service cron start
RUN mkdir /v3_advanced_rails
WORKDIR /v3_advanced_rails
RUN gem install bundler:2.3.17
COPY Gemfile /v3_advanced_rails/Gemfile
COPY Gemfile.lock /v3_advanced_rails/Gemfile.lock
COPY yarn.lock /v3_advanced_rails/yarn.lock
RUN bundle install
RUN yarn install
COPY . /v3_advanced_rails
