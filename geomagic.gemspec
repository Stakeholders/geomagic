# -*- encoding: utf-8 -*-
require File.expand_path('../lib/geomagic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Arturs Braucs", "Edgars Kaukis", "Creative Mobile"]
  gem.email         = ["arturs@creo.mobi"]
  gem.description   = %q{Plugin for working with Geo locations in serverside.}
  gem.summary       = %q{Plugin for working with Geo locations in serverside.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "geomagic"
  gem.require_paths = ["lib"]
  gem.version       = Geomagic::VERSION

  gem.add_development_dependency "rspec"

  gem.add_dependency "geokit-rails3"
  gem.add_dependency "geocoder"
  gem.add_dependency "GeoRuby"

  gem.add_dependency "activesupport", "~> 3.2.2"
  gem.add_dependency "rails", "~> 3.2.2"
end
