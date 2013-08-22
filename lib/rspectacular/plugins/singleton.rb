##############################################################################
#                            Singleton Plugin
##############################################################################

RSpec.configure do |config|
  config.around(:each, :singletons => lambda { |v| !!v }) do |example|
    require 'singleton'

    options             = example.metadata[:singletons]
    options             = options.is_a?(TrueClass) ? subject.class : options
    singletons_to_reset = options.respond_to?(:each) ? options : [options]

    singletons_to_reset.each do |singleton|
      Singleton.__init__(singleton)
    end

    example.run

    singletons_to_reset.each do |singleton|
      Singleton.__init__(singleton)
    end
  end
end
