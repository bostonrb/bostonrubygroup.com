source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.1"

gem "autoprefixer-rails"
gem "bourbon"
gem "flutie"
gem "httparty"
gem "jquery-rails"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rack-rewrite"
gem "rails", "~> 5.1.3"
gem "sass-rails"
gem "sprockets"
gem "title"
gem "uglifier"

group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "capybara"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
end

group :test do
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
