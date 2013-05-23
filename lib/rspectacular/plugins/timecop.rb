##############################################################################
#                               Timecop Plugin
##############################################################################

begin
  require 'timecop'

  RSpec.configure do |config|
    config.around(:each, :time_mock => lambda { |v| !!v }) do |example|
      options   = example.metadata[:time_mock]
      options   = case options
                  when Time
                    { :time => options }
                  when TrueClass
                    {}
                  end

      mock_type = options.fetch(:type, :freeze)
      time      = options.fetch(:time, Time.utc(2012, 7, 26, 18, 0, 0))

      Timecop.send(mock_type, time)

      example.run

      Timecop.return
    end
  end
rescue LoadError
end
