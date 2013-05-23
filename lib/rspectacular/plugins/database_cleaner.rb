##############################################################################
#                         Database Cleaner Plugin
##############################################################################

begin
  require 'database_cleaner'

  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each, :js => true) do
      DatabaseCleaner.strategy = :truncation, { :pre_count => true }
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end

  if defined? RSpec::Rails
    RSpec.configure do |config|
      config.use_transactional_fixtures = false
    end
  end
rescue LoadError
  if defined? RSpec::Rails
    RSpec.configure do |config|
      config.use_transactional_fixtures = true
    end
  end
end
