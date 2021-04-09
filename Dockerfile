FROM ruby:3.0.1

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apt-get -qq update && \
    apt-get -qq upgrade -y && \
		apt-get install -y nodejs
RUN apt-get -qq clean

## export RAILS_ENV for proper precompile
ARG RAILS_ENV
ARG BUNDLE_ARGS
ARG SECRET_KEY_BASE

# Set the working directory.
WORKDIR /usr/src/app

# Copy the file from your host to your current location.
COPY Gemfile* ./

RUN bundle install $BUNDLE_ARGS

# Add metadata to the image to describe which port the container is listening on at runtime.
EXPOSE 3000

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . ./

# Compile assets
# Not much time left to fix precompile issue. JS runtime is needed bcs of bootstrap's js dependencies
RUN bundle exec rake assets:precompile RAILS_ENV=$RAILS_ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Start the application
CMD bin/rails-startup.sh