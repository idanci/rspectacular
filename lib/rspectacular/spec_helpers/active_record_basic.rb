require File.expand_path(File.join('..', 'active_record_connection_setup'), __FILE__)
require 'rspectacular'

Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }
