FROM ruby:2.4

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, use apt-get to install those.
RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

# Configure the main working directory. 
RUN mkdir -p /emr-barbershop
WORKDIR /emr-barbershop

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY Gemfile /emr-barbershop/Gemfile 
COPY Gemfile.lock /emr-barbershop/Gemfile.lock
# RUN gem install bundler && bundle install --jobs 20 --retry 5
RUN bundle install

# Copy the main application.
COPY . /emr-barbershop

# Expose port 3000 to the Docker host, so it can be accessed 
# from the outside.
EXPOSE 3000

# Configure an entry point, so "bundle exec" doesnt
# need to be specified for each command.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
