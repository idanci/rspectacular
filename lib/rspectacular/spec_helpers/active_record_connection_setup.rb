require 'active_record'
require 'fileutils'
require 'logger'

begin
  FileUtils.mkdir 'log'
rescue Errno::EEXIST
end

log_file                              = File.join(Dir.pwd, 'log', 'activerecord.log')

rails_database_yaml_file_path         = File.join(Dir.pwd, 'config', 'database.yml')
rails_engine_database_yaml_file_path  = File.join(Dir.pwd, 'spec', 'dummy', 'config', 'database.yml')

database_yaml_file_path               = if File.exist? rails_engine_database_yaml_file_path
                                          rails_engine_database_yaml_file_path
                                        else
                                          rails_database_yaml_file_path
                                        end

connection_info                       = YAML.load_file(database_yaml_file_path)['test']

ActiveRecord::Base.logger = Logger.new(log_file)
ActiveRecord::Base.establish_connection(connection_info)
