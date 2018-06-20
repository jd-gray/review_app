source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'webpacker', '~> 3.5', '>= 3.5.3'
gem 'administrate'
gem 'cancancan'
gem 'foreman'
gem 'validates_timeliness', '~> 4.0', '>= 4.0.2'

group :development, :test do
  gem 'pry', '~> 0.11.3'
  gem 'pry-rails', '~> 0.3.6'
  gem 'pry-byebug', '~> 3.6'
  gem 'faker', git: 'https://github.com/stympy/faker'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end