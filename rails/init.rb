if RAILS_ENV == 'test'
  if defined? RSpec
    require 'rspectacular/matchers'
  end
end
