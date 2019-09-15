FROM ruby:2.4.2

ADD . /server/

WORKDIR /server

RUN bundle install

CMD ["ruby","server.rb"]