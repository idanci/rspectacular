RSpec.configure do |config|
  config.before(:suite, :time_mock => true) do
    require 'timecop'
  end

  config.after(:each, :time_mock => true) do
    Timecop.return
  end
end
