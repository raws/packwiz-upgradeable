FROM ruby:3-alpine

# Throw error if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

# Required for building Ruby gem C extensions
RUN apk add --update build-base

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["./bin/packwiz-upgradeable"]
CMD ["--help"]
