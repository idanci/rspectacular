begin
  require 'codeclimate-test-reporter'

  CodeClimate::TestReporter.start
rescue LoadError
end
