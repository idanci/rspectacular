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
  if defined?(Capybara::Webkit)
    Capybara.javascript_driver = :webkit
  end

end
