if defined? OmniAuth
  ###
  # Tell OmniAuth to just return whatever hash we want for each auth type
  #
  OmniAuth.config.test_mode            = true
  OmniAuth.config.mock_auth[:facebook] = MockAuthentication::Facebook.user

  ###
  # Except we don't want OmniAuth to fake anything when doing live tests
  #
  RSpec.configure do |config|
    config.before(:each, :js => true) do
      @previous_omniauth_test_mode = OmniAuth.config.test_mode

      OmniAuth.config.test_mode = false
    end

    config.after(:each, :js => true) do
      OmniAuth.config.test_mode = @previous_omniauth_test_mode
    end
  end
end
