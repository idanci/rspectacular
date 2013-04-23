begin
  require 'factory_girl'

  FactoryGirl.definition_file_paths << './spec/factories'

  if FactoryGirl.configuration.factories.count.zero?
    FactoryGirl.find_definitions
  end

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
  end
rescue LoadError
end
