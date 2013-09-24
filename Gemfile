source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'quiet_assets', :group => :development

gem 'airbrake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'mysql2'

gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "bcrypt-ruby"

gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

gem 'newrelic_rpm'

group :test, :development do
	gem 'debugger'
	gem 'rspec-rails'
	gem 'capybara'
	gem 'capybara-webkit'

	gem 'poltergeist'
	gem 'guard-rspec'
	gem 'rb-fsevent'
end
