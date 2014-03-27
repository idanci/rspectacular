begin
  unless RUBY_VERSION.match /\A1\.8/
    require 'simplecov'

    SimpleCov.start do
      add_filter '/config/'
      add_filter '/spec/'
      add_filter '/test/'
      add_filter '/features/'
    end
  end
rescue LoadError
end
