ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'database_cleaner'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  
  ActiveRecord::Migration.check_pending!

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.logger = Rails.logger

  setup { DatabaseCleaner.start }
  teardown { DatabaseCleaner.clean }
end
