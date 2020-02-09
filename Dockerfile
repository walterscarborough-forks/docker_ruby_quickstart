
FROM ruby:2.5
ARG app_name=do_not_forget_an_app_name
RUN echo "**** App name: $app_name ***"
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /app_name
WORKDIR /app_name
COPY Gemfile /app_name/Gemfile
COPY Gemfile.lock /app_name/Gemfile.lock
RUN bundle install
COPY . /app_name

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
