RSpec.configure do |config|
  config.add_formatter 'Fuubar'
  config.add_formatter 'documentation', 'tmp/rspec.txt'
end
