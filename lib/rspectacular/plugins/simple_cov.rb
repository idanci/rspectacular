begin
  require 'simplecov'

  SimpleCov.start do
    add_filter '/config/'
    add_filter '/spec/'
    add_filter '/test/'
    add_filter '/features/'
  end
rescue LoadError
end
