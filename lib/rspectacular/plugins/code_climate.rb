begin
  unless RUBY_VERSION.match /\A1\.8/
    require 'codeclimate-test-reporter'

    CodeClimate::TestReporter.start
  end
rescue LoadError
end
