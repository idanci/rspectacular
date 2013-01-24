if defined? Devise
  # Don't go nuts encrypting the password, we're just testing
  Devise.stretches = 1

  RSpec.configure do |config|
    config.include Devise::TestHelpers, :type => :controller
  end
end
