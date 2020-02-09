
FROM ruby:2.5
ARG dockerfile_app_name=do_not_forget_an_app_name_here
RUN echo "**** App name: $dockerfile_app_name ***"
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /dockerfile_app_name
WORKDIR /dockerfile_app_name
COPY Gemfile /dockerfile_app_name/Gemfile
COPY Gemfile.lock /dockerfile_app_name/Gemfile.lock
RUN bundle install
COPY . /dockerfile_app_name

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
