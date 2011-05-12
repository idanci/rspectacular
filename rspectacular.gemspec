# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rspectacular/version"

Gem::Specification.new do |s|
  s.name        = "rspectacular"
  s.version     = Rspectacular::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["jfelchner", "thekompanee"]
  s.email       = ["support@thekompanee.com"]
  s.homepage    = "https://github.com/jfelchner/rspectacular"
  s.summary     = %q{Custom RSpec matchers}
  s.description = %q{We rock some custom RSpec matchers like it ain't nobody's bidnezz.}

  s.rubyforge_project = "rspectacular"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('shoulda', '~> 2.11.0')
end
