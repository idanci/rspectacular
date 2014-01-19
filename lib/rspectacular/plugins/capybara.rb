##############################################################################
#                               Capybara Plugin
##############################################################################
#
# This plugin does not attempt to require capybara. It assumes that if you're
# using capybara, you're probably using something like Bundler which has already
# required it for you.
#
# If this is not the case, you will need to require it prior to requiring
# rspectacular.
#
# The same goes for capybara-webkit. It must be required before rspectacular.
#
if defined?(Capybara::Driver::Base)
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  if defined?(Capybara::Webkit)
    Capybara.javascript_driver = :webkit
  end

  RSpec.configure do |config|
    config.before(:each, :js => true) do
      page.driver.reset!
    end
  end
end
