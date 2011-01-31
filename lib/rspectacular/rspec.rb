require 'rspectacular/active_record/matchers'

module RSpec
  module Matchers
    include RSpectacular::ActiveRecord::Matchers
  end

  # module Rails
    # module ControllerExampleGroup
      # include Shoulda::ActionController::Matchers
    # end

    # module MailerExampleGroup
      # include Shoulda::ActionMailer::Matchers
    # end
  # end
end
