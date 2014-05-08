##############################################################################
#                               Devise Plugin
##############################################################################

begin
  require 'devise'

  Devise.stretches = 1

  RSpec.configure do |config|
    config.include Devise::TestHelpers,   :type => :controller
    config.include Warden::Test::Helpers, :type => :feature

    config.before(:all, :type => :feature) do |example|
      Warden.test_mode!
    end

    config.before(:each, :type => :controller) do |example|
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end
  end
rescue LoadError
end
