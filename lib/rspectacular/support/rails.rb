if defined? RSpec::Rails
  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = true
  end
end
