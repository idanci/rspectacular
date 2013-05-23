ENV["RAILS_ENV"] ||= 'test'
require File.join(Dir.pwd, 'spec', 'dummy', 'config', 'environment')

require 'rspec/rails'
require 'rspec/autorun'

require 'rspectacular'

Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }
