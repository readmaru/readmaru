# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.3"

gem "bootsnap", ">= 1.3", require: false
gem "rails", "~> 5.2.2"
gem "rails-i18n", "~> 5.1"
gem "pg", ">= 0.18", "< 2.0"
gem "hiredis", "~> 0.6"
gem "redis", "~> 4.1", require: %w(redis redis/connection/hiredis)
gem "dalli", "~> 2.7"
gem "sidekiq", "~> 5.2"
gem "bcrypt", "~> 3.1.13"
gem "uglifier", ">= 1.3.0"
gem "sass-rails", "~> 5.0"
gem "mini_magick", "~> 4.8"
gem "warden", "~> 1.2"
gem "addressable", "~> 2.5"
gem "shrine", "~> 2.18"
gem "aws-sdk-s3", "~> 1.43"
gem "image_processing", "~> 1.7"
gem "image_optim", "~> 0.26"
gem "image_optim_pack"
gem "streamio-ffmpeg", "~> 3"
gem "redcarpet", "~> 3.4"
gem "font-awesome-rails", "~> 4.7"
gem "browser", "~> 2.5"
gem "recaptcha", "~> 5.0"
gem "diffy", "~> 3.3"
gem "whenever", "1.0.0", require: false

group :development, :test do
  gem "rubocop", "~> 0.71.0", require: false
  gem "rspec-rails", "~> 3.8"
  gem "puma", "~> 4.0"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "factory_bot_rails", "~> 5"
  gem "capybara", "~> 3.24"
  gem "selenium-webdriver", "~> 3.142"
  gem "webmock", "~> 3.6"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
