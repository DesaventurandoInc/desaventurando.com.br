FROM ruby:alpine
WORKDIR /app

# Install dependencies
RUN apk upgrade --no-cache --update && apk add --no-cache --update make build-base git

# Copy Theme files to Workdir
COPY . /app

# Instal Gems 
RUN gem install bundler \
    && bundle install --jobs 4 --retry 3 

CMD ["bundle", "exec", "jekyll", "serve", "--watch" ,"--host=0.0.0.0"]

EXPOSE 4000