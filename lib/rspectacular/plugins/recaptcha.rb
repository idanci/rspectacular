##############################################################################
#                             Recaptcha Plugin
##############################################################################

begin
  require 'recaptcha'

  Recaptcha.configure do |config|
    config.skip_verify_env = ['test']
  end
rescue LoadError
end
