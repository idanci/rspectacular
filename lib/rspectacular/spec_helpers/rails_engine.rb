ENV["RAILS_ENV"] ||= 'test'

require File.expand_path(File.join('..', 'active_record_connection_setup'), __FILE__)
require File.join(Dir.pwd, 'spec', 'dummy', 'config', 'environment')

require 'rspec/rails'

Pathname.glob("#{Dir.pwd}/app/*").each do |directory|
  if directory.directory?
    $LOAD_PATH.unshift(directory) unless $LOAD_PATH.include?(directory)
  end
end

require 'rspectacular'

Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }
