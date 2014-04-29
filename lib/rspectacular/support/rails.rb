require 'rspectacular/plugins/rails/engine'

if defined? RSpec::Rails
  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = true

    if File.join(Dir.pwd, 'spec', 'dummy', 'config', 'environment')
      config.include RSpectacular::NamespacedEngineControllerRouteFix, :type => :controller
    end
  end
end
