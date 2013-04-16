require 'singleton'

RSpec.configure do |config|
  config.around(:each, :singletons => lambda { |v| !!v }) do |example|
    options             = example.metadata[:singletons]
    singletons_to_reset = options.respond_to?(:each) ? options : [options]

    example.run

    singletons_to_reset.each do |singleton|
      Singleton.__init__(singleton)
    end
  end
end
