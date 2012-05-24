# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omniauth-scaffold"
  s.version = "0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Shun Matsumoto"]
  s.date = "2012-05-24"
  s.description = "Scaffold for OmniAuth."
  s.email = "s.matsumoto0115@gmail.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/generators/omniauth/scaffold/scaffold_generator.rb",
    "lib/generators/omniauth/scaffold/templates/README.md",
    "lib/generators/omniauth/scaffold/templates/app/assets/stylesheets/base.css.scss",
    "lib/generators/omniauth/scaffold/templates/app/assets/stylesheets/scaffolds.css.scss",
    "lib/generators/omniauth/scaffold/templates/app/controllers/application_controller.rb",
    "lib/generators/omniauth/scaffold/templates/app/controllers/sessions_controller.rb",
    "lib/generators/omniauth/scaffold/templates/app/controllers/top_controller.rb",
    "lib/generators/omniauth/scaffold/templates/app/models/user.rb",
    "lib/generators/omniauth/scaffold/templates/app/views/layouts/application.html.erb",
    "lib/generators/omniauth/scaffold/templates/app/views/top/index.html.erb",
    "lib/generators/omniauth/scaffold/templates/config/initializers/constants.rb",
    "lib/generators/omniauth/scaffold/templates/config/initializers/local_setting.rb",
    "lib/generators/omniauth/scaffold/templates/config/initializers/omniauth.rb",
    "lib/generators/omniauth/scaffold/templates/config/locales/ja.yml",
    "lib/generators/omniauth/scaffold/templates/db/migrate/create_users.rb",
    "omniauth-scaffold.gemspec",
    "spec/omniauth-scaffold_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/shu0115/omniauth-scaffold"
  s.licenses = ["CC BY-NC-SA 2.1"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "OmniAuth Scaffold"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth-twitter>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-github>, [">= 0"])
      s.add_runtime_dependency(%q<omniauth-facebook>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
    else
      s.add_dependency(%q<omniauth-twitter>, [">= 0"])
      s.add_dependency(%q<omniauth-github>, [">= 0"])
      s.add_dependency(%q<omniauth-facebook>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    end
  else
    s.add_dependency(%q<omniauth-twitter>, [">= 0"])
    s.add_dependency(%q<omniauth-github>, [">= 0"])
    s.add_dependency(%q<omniauth-facebook>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
  end
end

