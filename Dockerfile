FROM ruby:3.2.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.4.8 && bundle install

COPY . .

EXPOSE 3000

ENV RAILS_ENV development

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]