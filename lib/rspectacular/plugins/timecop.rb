if defined? Timecop
  RSpec.configure do |config|
    config.after(:each, :time_mock => true) do
      Timecop.return
    end
  end
end
