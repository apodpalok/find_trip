source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'mini_magick'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'
gem 'bower-rails', '~> 0.11.0'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'geocoder'
gem 'gmaps4rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'mailboxer'
gem 'momentjs-rails', '>= 2.9.0'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'pry-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.2'
gem 'rails_admin', '~> 1.1.1'
gem 'rest-client'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'kaminari'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'rabl-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda', '~> 3.5'
  gem 'simplecov', :require => false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
