source 'https://rubygems.org'
 
gem 'rails', '~> 4.0'
gem 'carrierwave' # for file attachment
gem 'sqlite3'
gem 'rmagick' # resize images - good in conjunction with carrierwave
gem 'cancan' # for authorization 
gem 'devise' # handles authentication
 
group :test, :development do
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'pry-nav'
end

 
group :assets do
  # Gems used only for assets and not required
  # in production environments by default.
  gem 'sass-rails'
  gem 'jquery-rails'
  gem 'jquery-ui-rails' # the following provides the stylinmg for the datatables, among other things
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'bootstrap-sass', '~> 2.0.4.1'
end
 
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'debugger'
