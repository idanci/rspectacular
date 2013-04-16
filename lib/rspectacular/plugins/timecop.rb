begin
  require 'timecop'

  RSpec.configure do |config|
    config.around(:each, :time_mock => lambda { |v| !!v }) do |example|
      options   = example.metadata[:time_mock]
      options   = options.is_a?(Hash) ? options : {}
      time      = options.is_a?(Time) ? options : (options[:time] || Time.utc(2012, 7, 26, 18, 0, 0))
      mock_type = options.fetch(:type, :freeze)

      Timecop.send(mock_type, time)

      example.run

      Timecop.return
    end
  end
rescue LoadError
end
