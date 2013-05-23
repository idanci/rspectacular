##############################################################################
#                               PayPal Plugin
##############################################################################

RSpec.configure do |config|
  config.before(:each, :js => true, :paypal => true) do
    log_in_to_paypal_sandbox
  end

  config.after(:each, :js => true, :paypal => true) do
    log_out_of_paypal
    log_out_of_paypal_sandbox
  end
end
