source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# 標準Gemfile
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.6"
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.5.5'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.2.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '>= 5.3.0'

# TODO: この辺りはあとでwebpackerから乗り換えする
# # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
# gem "importmap-rails"
# # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
# gem "turbo-rails"
# # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
 
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# 非標準Gem
# paging
gem 'kaminari'

# auth
gem 'devise'
gem 'omniauth'

# slim generator
gem 'slim-rails'

# Notify Error
gem 'sentry-rails'
gem 'sentry-ruby'

# Search Form
gem 'ransack'

group :development, :test do
  # 標準Gem
	# See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # 非標準Gem
  # https://github.com/bkeepers/dotenv/
  gem 'dotenv-rails'
end

group :development do
  # 標準Gem
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
	# Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  # 非標準Gem
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-minitest', require: false # https://github.com/rubocop/rubocop-minitest
  gem 'rubocop-packaging', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  # N+1検知用(https://github.com/flyerhzm/bullet)
  gem 'bullet'
  gem 'letter_opener_web'
end

group :test do
  # 標準Gem
	# Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
