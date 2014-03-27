##############################################################################
#                                 VCR Plugin
##############################################################################

begin
  require 'vcr'

  begin
    require 'webmock'

    VCR.configure do |config|
      config.hook_into :webmock
    end
  rescue LoadError
  end

  begin
    require 'faraday'

    VCR.configure do |config|
      config.hook_into :faraday
    end
  rescue LoadError
  end

  VCR.configure do |config|
    config.cassette_library_dir = File.expand_path('./tmp/vcr_cassettes')

    config.configure_rspec_metadata!
  end
rescue LoadError
end
