if defined? RSpec && defined? Capybara
  Dir[File.expand_path('../helpers/**/*.rb', __FILE__)].each { |f| require f }
end
