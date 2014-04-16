require 'rspectacular/helpers/factories'
require 'rspectacular/helpers/null_objects'
require 'rspectacular/helpers/rails_flashes'
require 'rspectacular/helpers/session_helpers'

if defined?(Capybara::Driver::Base)
  Dir[File.expand_path('../helpers/**/*.rb', __FILE__)].each { |f| require f }
end
