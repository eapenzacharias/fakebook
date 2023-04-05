source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'activestorage', '~> 6.1.7', '>= 6.1.7.3'
gem 'aws-sdk-s3'
gem 'binding_of_caller', '~> 0.8.0'
gem 'bootstrap', '~> 4.3.1'
gem 'devise', '~> 4.7', '>= 4.7.2'
gem 'faker', '~> 1.6', '>= 1.6.3'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'font-awesome-rails', '>= 4.7.0.6'
gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem 'jquery-rails', '~> 4.4', '>= 4.4.0'
gem 'omniauth-facebook', '>= 6.0.0'
gem 'popper_js', '~> 1.14', '>= 1.14.5'
gem 'sprockets-rails', '~> 3.2.2'
gem 'will_paginate', '~> 3.2'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.7', '>= 6.1.7.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 4.3', '>= 4.3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9', '>= 2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.7.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.32.2'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'guard', '2.13.0'
  gem 'guard-minitest', '2.4.4'
  gem 'minitest'
  gem 'minitest-reporters', '1.1.14'
  gem 'rails-controller-testing', '1.0.3'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'webdrivers', '~> 4.1', '>= 4.1.3'
end

group :development, :test do
  gem 'factory_bot_rails', '~> 5.2', '>= 5.2.0'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 3.9', '>= 3.9.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
