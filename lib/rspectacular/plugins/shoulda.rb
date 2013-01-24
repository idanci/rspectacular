if defined? Shoulda::Matchers
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
end
