##############################################################################
#                              WebMock Plugin
##############################################################################

begin
  require 'webmock/rspec'

  RSpec.configure do |config|
    config.around(:each, :web_mock => lambda { |v| !!v }) do |example|
      options = example.metadata[:web_mock]
      options = case options
                when TrueClass
                  { :allow_localhost => true }
                end

      WebMock.disable_net_connect!(options)

      example.run

      WebMock.allow_net_connect!
    end
  end

rescue LoadError
end
