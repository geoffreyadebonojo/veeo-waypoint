require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'database_cleaner'
require 'vcr'
require 'webmock/rspec'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  
  config.before(:each) do #cleans at beginning
    DatabaseCleaner.clean
  end
  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.after(:each) do #cleans after each test
    DatabaseCleaner.clean
   end

  config.include FactoryBot::Syntax::Methods
  config.after(:each) do
    # reset all FactoryBot sequences after each test
    FactoryBot.reload
  end
end

VCR.configure do |config|
  # TODO: Switch to "new episodes" after we have the configuration working
  # config.default_cassette_options = { :record => :all }

  config.ignore_localhost = true
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<BING_CLIENT_ID>") { ENV['BING_CLIENT_ID'] }
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end


OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'google_oauth2',
                  'uid'      => '12345',
                  'info'     => {
                                 'first_name'  => 'test_name',
                                 'last_name'   => 'test_email',
                                 'email'       => 'test@email.com',
                                 'image'       => 'http://testimage.jpg'
                                },
                }.with_indifferent_access
OmniAuth.config.add_mock(:google_oauth2, omniauth_hash)

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :selenium_chrome
Capybara.configure do |config|
  config.default_max_wait_time = 5
end