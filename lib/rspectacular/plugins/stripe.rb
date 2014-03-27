##############################################################################
#                               Stripe Plugin
##############################################################################

begin
  require 'stripe'

  RSpec.configure do |config|
    config.after(:suite, :stripe) do
      VCR.turn_off!               if defined?(VCR)
      WebMock.allow_net_connect!  if defined?(WebMock)

      Stripe::Plan.all(:count => 100).each do |plan|
        if plan.id.match(/test/i) || plan.name.match(/test/i)
          plan.delete
        end
      end

      Stripe::Customer.all(:count => 100).each(&:delete)

      VCR.turn_on! if defined?(VCR)
    end
  end
rescue LoadError
end
