##############################################################################
#                                 VCR Plugin
##############################################################################

begin
  require 'vcr'
  require 'rspectacular/plugins/webmock'

  VCR.configure do |config|
    config.cassette_library_dir = File.expand_path('./tmp/vcr_cassettes')

    config.hook_into :webmock
    config.configure_rspec_metadata!
  end

  RSpec.configure do |config|
    config.extend VCR::RSpec::Macros
  end

rescue LoadError
end
