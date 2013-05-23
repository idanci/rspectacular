##############################################################################
#                             Shoulda Plugin
##############################################################################

if defined? RSpec::Rails
  begin
    require 'shoulda-matchers'

    module ShouldaRoutingMatchers
      def route(method, path)
        Shoulda::Matchers::ActionController::RouteMatcher.new(method, path, self)
      end
    end

    module RSpec
      module Rails
        module RoutingExampleGroup
          include ShouldaRoutingMatchers
        end
      end
    end
  rescue LoadError
  end
end
