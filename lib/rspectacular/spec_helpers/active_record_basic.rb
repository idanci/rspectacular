require 'active_record'

rails_database_yaml_file_path         = File.join(Dir.pwd, 'config', 'database.yml')
rails_engine_database_yaml_file_path  = File.join(Dir.pwd, 'spec', 'dummy', 'config', 'database.yml')

database_yaml_file_path               = if File.exist? rails_engine_database_yaml_file_path
                                          rails_engine_database_yaml_file_path
                                        else
                                          rails_database_yaml_file_path
                                        end

connection_info                       = YAML.load_file(database_yaml_file_path)['test']

ActiveRecord::Base.establish_connection(connection_info)

require 'rspectacular'

Dir[File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')].each { |f| require f }
