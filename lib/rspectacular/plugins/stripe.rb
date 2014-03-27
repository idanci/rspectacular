##############################################################################
#                               Stripe Plugin
##############################################################################

begin
  require 'stripe'

  RSpec.configure do |config|
    config.after(:suite, :stripe) do
      Stripe::Plan.all(:count => 100).each do |plan|
        if plan.id.match(/test/i) || plan.name.match(/test/i)
          plan.delete
        end
      end

      Stripe::Customer.all(:count => 100).each(&:delete)
    end
  end
rescue LoadError
end
