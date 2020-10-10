FROM ruby:2.7-alpine
RUN apk add --no-cache build-base gcc bash cmake git
RUN gem install bundler jekyll

COPY . /bloga

VOLUME /bloga

WORKDIR bloga

RUN bundle install

EXPOSE 4000
CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0" ]
