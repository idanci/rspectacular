if defined? Recaptcha
  Recaptcha.configure do |config|
    config.skip_verify_env = ['test']
  end
end
