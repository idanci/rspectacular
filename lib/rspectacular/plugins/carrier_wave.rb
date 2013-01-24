###
# Make CarrierWave tests faster and more reliable
#
if defined? CarrierWave
  require 'carrierwave/test/matchers'

  CarrierWave.configure do |config|
    config.storage           = :file
    config.root              = Rails.root.join('tmp')
    config.enable_processing = false
  end

  RSpec.configure do |config|
    config.include CarrierWave::Test::Matchers, :carrier_wave => true

    config.before(:each, :carrier_wave => true) do
      subject.class.enable_processing = true
    end

    config.after(:each, :carrier_wave => true) do
      subject.class.enable_processing = false
    end
  end
end
