module RSpectacular
  module Matchers
    module Authentication
      def it_should_require_authentication_for(*actions)
        actions.each do |action_parts|
          method, action, params = action_parts

          params ||= {}
          params.reverse_merge! :id => 1

          it "#{method.upcase} ##{action} should require login" do
            send(method, action, params)

            response.should redirect_to(new_user_session_path)
          end
        end
      end

      def it_should_not_require_authentication_for(*actions)
        actions.each do |action_parts|
          method, action, params = action_parts

          params ||= {}
          params.reverse_merge! :id => 1

          it "#{method.upcase} ##{action} should not require login" do
            send(method, action, params)

            response.should_not redirect_to(new_user_session_path)
          end
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.extend RSpectacular::Matchers::Authentication, :type => :controller
end
