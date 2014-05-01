##############################################################################
#                           Referehencible Plugin
##############################################################################

begin
  require 'referehencible'

  RSpec.configure do |config|
    config.before(:each, :mock_refs => lambda { |v| !!v }) do |example|
      reference = if example.metadata[:mock_refs].is_a? TrueClass
                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                  else
                    example.metadata[:mock_refs]
                  end

      allow(Referehencible).to receive(:reference_number).
                               and_return(reference)
    end
  end
rescue LoadError
end
