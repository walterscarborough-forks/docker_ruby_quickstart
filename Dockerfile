FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /mycoolapp
WORKDIR /mycoolapp
COPY Gemfile /mycoolapp/Gemfile
COPY Gemfile.lock /mycoolapp/Gemfile.lock
RUN bundle install
COPY . /mycoolapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
