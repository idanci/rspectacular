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
  else
    Capybara.javascript_driver = :selenium
  end

  RSpec.configure do |config|
    config.before(:each, :js => true) do
      page.driver.reset!
    end
  end

  if defined?(Chamber)
    Capybara.default_host = Chamber.env.http.host_with_port
    Capybara.app_host     = Chamber.env.http.base_url
    Capybara.server_port  = Chamber.env.http.port
  end
end
