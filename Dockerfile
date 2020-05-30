FROM ruby:2.5
RUN mkdir /test2
WORKDIR /test2
COPY Gemfile /test2/Gemfile
COPY Gemfile.lock /test2/Gemfile.lock
RUN bundle install
COPY . /test2
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]