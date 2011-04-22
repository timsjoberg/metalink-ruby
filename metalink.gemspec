# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metalink/version"

Gem::Specification.new do |s|
  s.name        = "metalink"
  s.version     = Metalink::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tim Sjoberg"]
  s.email       = ["timothysjoberg@gmail.com"]
  s.homepage    = "https://github.com/timsjoberg/metalink-ruby"
  s.summary     = %q{Simple library for creating metalink files}
  s.description = %q{Horribly simple, completely unconfigurable library for creating metalink (version 3) files}

  s.rubyforge_project = "metalink-ruby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
