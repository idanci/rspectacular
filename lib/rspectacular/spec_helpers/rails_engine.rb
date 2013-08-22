ENV["RAILS_ENV"] ||= 'test'

require File.expand_path(File.join('..', 'active_record_connection_setup'), __FILE__)
require File.join(Dir.pwd, 'spec', 'dummy', 'config', 'environment')

require 'rspec/rails'
require 'rspec/autorun'

require 'rspectacular'

Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }
