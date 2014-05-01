##############################################################################
#                               Bullet Plugin
##############################################################################

begin
  require 'bullet'

  Bullet.enable        = true
  Bullet.bullet_logger = true
  Bullet.raise         = true

  if defined?(Chamber) && Chamber.env.bugsnag
    Bullet.bugsnag     = { api_key: Chamber.env.bugsnag.api_key }
  end

  RSpec.configure do |config|
    config.before(:each) do
      Bullet.start_request if Bullet.enable?
    end

    config.after(:each) do
      if Bullet.enable?
        Bullet.perform_out_of_channel_notifications if Bullet.notification?
        Bullet.end_request
      end
    end
  end
rescue LoadError
end
