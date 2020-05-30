FROM ruby:2.5
# RUN mkdir /test2 \
#    && apt update \
#    && apt-get install libxml2-dev libxslt-dev \
#    && apt install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev
# RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com

#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
#RUN  sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
#RUN  sed -i s@/security.debian.org/@/mirrors.163.com/@g /etc/apt/sources.list
#RUN  apt-get clean

#RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
# RUN apt-get update && apt-get install -y  nodejs  yarn mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /test2
COPY Gemfile /test2/Gemfile
# COPY Gemfile.lock /test2/Gemfile.lock
RUN apt-get install libxslt-dev libxml2-dev
RUN gem install nokogiri -v '1.10.9'
RUN bundle config build.nokogiri --use-system-libraries
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