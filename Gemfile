# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "rails", "~> 8.0.0.rc2"

gem "mysql2"
gem "pg"
gem "sqlite3"
gem "trilogy"

gem "propshaft"

gem "image_processing"
gem "importmap-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

gem "puma", ">= 5.0"

gem "solid_cable"
gem "solid_cache"
gem "solid_queue"

gem "marginalia"

gem "bootsnap", require: false
gem "thruster", require: false

group :development, :test do
  gem "amazing_print"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "factory_bot_rails"
  gem "faker"

  gem "brakeman", require: false
  gem "i18n-tasks", require: false
end

group :development do
  gem "kramdown"
  gem "listen"
  gem "lookbook"
  gem "web-console"

  gem "appraisal", require: false
  gem "benchmark-ips", require: false
  gem "benchmark-memory", require: false
  gem "mdl", require: false
  gem "rdoc", require: false
  gem "rorvswild_theme_rdoc", require: false
  gem "simplecov", require: false
  gem "simplecov-console", require: false
  gem "thor", require: false

  # gem 'erb_lint-picket', require: false, path: 'erb_lint-picket'
  gem "rubocop-picket", github: "picketengine/rubocop-picket", require: false
end

group :test do
  gem "capybara", ">= 3.39"
  gem "selenium-webdriver", ">= 4.20.0"

  gem "mocha", require: false
  gem "webmock", require: false
end
