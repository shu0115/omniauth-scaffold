# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-scaffold/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["shu0115"]
  gem.email         = ["raisondetre0115@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-scaffold"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Scaffold::VERSION
end
