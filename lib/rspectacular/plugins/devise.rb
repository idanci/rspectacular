##############################################################################
#                               Devise Plugin
##############################################################################

begin
  require 'devise'

  Devise.stretches = 1

  RSpec.configure do |config|
    config.include Devise::TestHelpers, :type => :controller
  end
rescue LoadError
end
