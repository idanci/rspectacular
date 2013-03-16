begin
  require 'timecop'

  RSpec.configure do |config|
    config.around(:each, :time_mock => true) do |example|
      Timecop.freeze(Time.utc(2012, 7, 26, 18, 0, 0))

      example.run

      Timecop.return
    end
  end
rescue LoadError
end
