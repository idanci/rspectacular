##############################################################################
#                             OmniAuth Plugin
##############################################################################

begin
  require 'omniauth'
  require 'rspectacular/mock_authentications/omniauth'

  ###
  # Tell OmniAuth to just return whatever hash we want for each auth type
  #
  OmniAuth.configure do |config|
    config.test_mode            = true
    config.mock_auth[:facebook] = OmniAuth::MockAuthentications::Facebook.authentication
    config.mock_auth[:twitter]  = OmniAuth::MockAuthentications::Twitter.authentication
  end

  ###
  # Except we don't want OmniAuth to fake anything when doing live tests
  #
  RSpec.configure do |config|
    config.around(:each, :js => true) do |example|
      previous_omniauth_test_mode = OmniAuth.config.test_mode
      OmniAuth.config.test_mode   = false

      example.run

      OmniAuth.config.test_mode = previous_omniauth_test_mode
    end
  end
rescue LoadError
end
