source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '>= 5.2.2'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '>= 5.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# see https://guides.rubyonrails.org/caching_with_rails.html#cache-stores
# gem 'redis-rails'
# gem 'hiredis'
# FIXME: 検証中
# gem 'redis', '>= 3.2.0', require: ['redis', 'redis/connection/hiredis']
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'listen'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # https://github.com/bkeepers/dotenv/
  gem 'dotenv-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false # https://github.com/rubocop/rubocop-minitest
  gem 'rubocop-packaging', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console', '>= 3.3.0'
  # N+1検知用(https://github.com/flyerhzm/bullet)
  gem 'bullet'
  gem 'letter_opener_web'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '>= 2.15' # ※今は要らないので、一旦コメントアウト
  # gem 'selenium-webdriver' # ※現状使っていないし、そもそもchildprocessの古いバージョンを入れてしまうので、一旦コメントアウト。
  # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers' # ※今は要らないので、一旦コメントアウト
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'

# paging
gem 'kaminari'

# auth
gem 'devise'
gem 'omniauth'

# slim generator
gem 'slim-rails'

# ERB形式のファイルをslim形式に変換してくれる
gem 'html2slim', '~> 0.2.0'

# Sentry
gem 'sentry-rails'
gem 'sentry-ruby'

# Ransack
gem 'ransack'
