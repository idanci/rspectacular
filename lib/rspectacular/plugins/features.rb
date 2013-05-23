##############################################################################
#                               Features Plugin
##############################################################################
#
# This plugin enables the feature/scenario/background/given syntax in RSpec
# without requiring Capybara as a dependency (and may also be used outside of
# Rails).  The contents of this file are taken verbatim from
#
# https://github.com/jnicklas/capybara/blob/cd4327857bd3bafa8614b7bffb2886a8ab401953/lib/capybara/rspec/features.rb
#
# and should be updated whenever that file is updated.
#
module Capybara
  module Features
    def self.included(base)
      base.instance_eval do
        alias :background :before
        alias :scenario :it
        alias :xscenario :xit
        alias :given :let
        alias :given! :let!

        if defined?(RSpec::Rails)
          include RSpec::Rails::RequestExampleGroup
          include Rack::Test::Methods
        end
      end
    end
  end
end

def self.feature(*args, &block)
  options = if args.last.is_a?(Hash) then args.pop else {} end
  options[:capybara_feature] = true
  options[:type] = :feature
  options[:caller] ||= caller
  args.push(options)

  describe(*args, &block)
end

RSpec.configuration.include Capybara::Features, :capybara_feature => true
