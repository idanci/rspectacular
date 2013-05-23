##############################################################################
#                               Email Plugin
##############################################################################
#
# The approach to this plugin is twofold. First it uses the excellent email_spec
# gem to add helpers and matchers to any spec file with :email => true set.
# Secondly, it will also clear all deliveries from ActionMailer if it is loaded.
#
# https://github.com/bmabey/email-spec/
#
begin
  require 'email_spec'

  RSpec.configure do |config|
    config.include EmailSpec::Helpers,  :email => true
    config.include EmailSpec::Matchers, :email => true
  end
rescue LoadError
end

if defined? ActionMailer
  RSpec.configure do |config|
    config.after(:each, :email => true) do
      ActionMailer::Base.deliveries.clear
    end
  end
end
