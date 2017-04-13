require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'factory_girl'
require 'support/factory_girl'
require 'support/controller_macros'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerMacros, type: :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
