##############################################################################
#                               PayPal Plugin
##############################################################################

RSpec.configure do |config|
  config.before(:each, :js => true, :paypal => true) do
    require 'rspectacular/helpers/paypal'

    log_in_to_paypal_sandbox
  end
end
