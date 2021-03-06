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
    config.mock_auth[:ebay]     = OmniAuth::MockAuthentications::Ebay.authentication
  end

  ###
  # Except we don't want OmniAuth to fake anything when doing live tests
  #
  RSpec.configure do |config|
    config.around(:each, :js => true) do |example|
      previous_omniauth_test_mode = OmniAuth.config.test_mode
      OmniAuth.config.test_mode   = false

      example.metadata.fetch(:mock_auth, {}).each do |auth_type, auth_hash|
        OmniAuth.config.add_mock(auth_type, auth_hash)
      end

      example.run

      OmniAuth.config.test_mode = previous_omniauth_test_mode
    end

    config.before(:each, type: :controller, mock_auth: lambda { |v| !!v }) do |example|
      if example.metadata[:mock_auth].is_a? Symbol
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[example.metadata[:mock_auth]]
      else
        request.env['omniauth.auth'] = OmniAuth::AuthHash.new(example.metadata[:mock_auth])
      end
    end
  end
rescue LoadError
end
