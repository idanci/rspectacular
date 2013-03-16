RSpec.configure do |config|
  config.before(:all, :time_mock => true) do
    require 'timecop'

    Timecop.freeze(Time.utc(2012, 7, 26, 18, 0, 0))
  end

  config.after(:each, :time_mock => true) do
    Timecop.return
  end
end
