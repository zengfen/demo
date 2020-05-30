FROM ruby:2.5
RUN mkdir /test2 \
    && apt-get install libxml2-dev libxslt-dev \
    && apt install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev
WORKDIR /test2
COPY Gemfile /test2/Gemfile
COPY Gemfile.lock /test2/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries \
    && bundle install
COPY . /test2
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]