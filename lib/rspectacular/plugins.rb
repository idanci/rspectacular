if defined? RSpec
  Dir[File.expand_path('../plugins/**/*.rb', __FILE__)].each { |f| require f }
end
