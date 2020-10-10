FROM ruby:2.7-alpine
RUN apk add --no-cache build-base gcc bash cmake git
RUN gem install bundler jekyll

# WORKDIR blog1

# COPY . .

# copy repo
COPY . /blog1

# set mount point
VOLUME /blog1

# switch to repo directory
WORKDIR blog1

RUN bundle install

EXPOSE 4000
CMD [ "bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0" ]


