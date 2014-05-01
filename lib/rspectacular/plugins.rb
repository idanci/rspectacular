Dir[File.expand_path('../plugins/**/*.rb', __FILE__)].
  reject { |filename| filename.match /(code_climate|simple_cov)\.rb\z/ }.
  each   { |filename| require filename }
