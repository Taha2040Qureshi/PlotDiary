source 'https://rubygems.org'

gem 'bcrypt'

gem 'rails', '4.2.5'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0', :group => :doc

gem 'devise'

gem 'activeadmin', :github => 'activeadmin'

gem 'country-select'

gem 'geocoder'

gem 'gmaps4rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

gem 'mina', github: 'nadarei/mina'
gem 'mina-multistage', require: false

group :development do
  # Use mysql as the database for Active Record
  gem 'mysql2', '>= 0.3.18', '< 0.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'exception_notification'
end

gem 'client_side_validations'
