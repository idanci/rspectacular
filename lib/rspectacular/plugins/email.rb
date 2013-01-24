if defined? EmailSpec
  RSpec.configure do |config|
    config.include EmailSpec::Helpers,  :email => true
    config.include EmailSpec::Matchers, :email => true
  end
end

if defined? ActionMailer
  RSpec.configure do |config|
    config.after(:each, :email => true) do
      # Clear all ActionMailer test emails after email specs
      ActionMailer::Base.deliveries.clear
    end
  end
end
