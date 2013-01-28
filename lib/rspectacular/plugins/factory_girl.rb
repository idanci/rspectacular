begin
  require 'factory_girl'

  if FactoryGirl.configuration.factories.count.zero?
    FactoryGirl.find_definitions
  end

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
  end
rescue LoadError
end
