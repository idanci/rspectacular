if defined?(Capybara::Driver::Base) && defined?(Capybara::Webkit)
  Capybara.javascript_driver = :webkit
end
