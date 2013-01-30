# For when you just have to know what the hell the browser is doing
RSpec.configure do |config|
  config.alias_example_to :sit, :focused => true, :js => true, :driver => :selenium
end
