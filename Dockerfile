FROM ruby:2.6.3
# RAILS_ENV と RAILS_MASTER_KEY をあと差し
ARG RAILS_ENV
ARG RAILS_MASTER_KEY
ENV APP_ROOT /app
# あと差しした RAILS_ENV と RAILS_MASTER_KEY を環境変数に設定
ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
WORKDIR $APP_ROOT

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN gem install bundler:2.0.2
RUN bundle install && rm -rf ~/.gem
COPY . $APP_ROOT
# RAILS_ENV が production のとき assets:precompile を実行するようにしています
RUN if [ "${RAILS_ENV}" = "production" ]; then bundle exec rails assets:precompile assets:clean; else export RAILS_ENV=development; fi
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

