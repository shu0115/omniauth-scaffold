# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-scaffold/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["shu0115"]
  gem.email         = ["raisondetre0115@gmail.com"]
  gem.description   = %q{Scaffold for OmniAuth.}
  gem.summary       = %q{OmniAuth Scaffold}
  gem.homepage      = "https://github.com/shu0115/omniauth-scaffold"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-scaffold"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Scaffold::VERSION

  gem.add_dependency 'rails_config'
  gem.add_dependency 'omniauth-twitter'
  gem.add_dependency 'omniauth-facebook'
  gem.add_dependency 'omniauth-github'
  gem.add_dependency 'tapp'
  gem.add_dependency 'awesome_print'
end
