begin
  require 'vcr'

  VCR.configure do |config|
    config.cassette_library_dir = 'tmp/vcr_cassettes'

    config.hook_into :faraday
    config.configure_rspec_metadata!
  end

rescue LoadError
end
