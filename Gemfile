source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.1"

gem "autoprefixer-rails"
gem "bourbon", "~> 5.0"
gem "flutie"
gem "jquery-rails"
gem "pg", "~> 0.18"
gem "puma"
gem "rack-canonical-host"
gem "rack-rewrite"
gem "rails", "~> 5.1.3"
gem "sass-rails", "~> 5.0"
gem "sprockets", "~> 3.7.2"
gem "title"
gem "uglifier"
gem "httparty"

group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "rspec_junit_formatter"
  gem "rspec-rails", "~> 3.6"
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
