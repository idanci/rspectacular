###
#
# Shamelessly stolen from http://ariejan.net/2011/09/24/rspec-speed-up-by-tweaking-ruby-garbage-collection/
#
module RSpectacular
  class DeferredGarbageCollection
    THRESHOLD = (ENV['DEFER_GC'] || 20.0).to_f

    def self.start
      cycle_garbage_collector if enabled?
    end

    def self.reconsider
      if enabled? && over_deferrment_threshold?
        cycle_garbage_collector

        garbage_last_collected_at = Time.now
      end
    end

    private

    def self.cycle_garbage_collector
      GC.enable
      GC.start
      GC.disable
    end

    def self.over_deferrment_threshold?
      time_since_garbage_last_collected >= THRESHOLD
    end

    def self.enabled?
      THRESHOLD > 0
    end

    def self.time_since_garbage_last_collected
      Time.now - garbage_last_collected_at
    end

    def self.garbage_last_collected_at
      @garbage_last_collected_at || Time.now
    end

    def self.garbage_last_collected_at=(value)
      @garbage_last_collected_at = value
    end
  end
end

RSpec.configure do |config|
  config.before(:all) do
    RSpectacular::DeferredGarbageCollection.start
  end

  config.after(:all) do
    RSpectacular::DeferredGarbageCollection.reconsider
  end
end
