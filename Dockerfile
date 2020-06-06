FROM ubuntu:18.04
FROM ruby:2.6.5
FROM rails:6.0.3.1
ENV LANG C.UTF-8
RUN apt-get update
ADD Gemfile /football_news/Gemfile
ADD Gemfile.lock /football_news/Gemfile.lock
RUN bundle install
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
