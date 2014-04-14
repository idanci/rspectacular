##############################################################################
#                               Devise Plugin
##############################################################################

begin
  require 'devise'

  Devise.stretches = 1

  RSpec.configure do |config|
    config.include Devise::TestHelpers,   :type => :controller
    config.include Warden::Test::Helpers, :type => :feature

    config.before(:suite, :type => :feature) do |example|
      Warden.test_mode!
    end
  end
rescue LoadError
end
