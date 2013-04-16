RSpec.configure do |config|
  config.around(:each, :singletons => lambda { |v| !!v }) do |example|
    options             = example.metadata[:singletons]
    singletons_to_reset = options.respond_to?(:each) ? options : []

    example.run

    singletons_to_reset.each do |singleton|
      singleton.class_variable_set(:@@singleton__instance__, nil)
    end
  end
end
