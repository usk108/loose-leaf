# -*- encoding: utf-8 -*-
# stub: rails-flog 1.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-flog"
  s.version = "1.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["pinzolo"]
  s.date = "2014-04-28"
  s.description = "This formats parameters and sql in rails log."
  s.email = ["pinzolo@gmail.com"]
  s.homepage = "https://github.com/pinzolo/rails-flog"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Rails log formatter for parameters and sql"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.2.0"])
      s.add_runtime_dependency(%q<anbt-sql-formatter>, [">= 0"])
      s.add_runtime_dependency(%q<awesome_print>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.2.0"])
      s.add_dependency(%q<anbt-sql-formatter>, [">= 0"])
      s.add_dependency(%q<awesome_print>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.2.0"])
    s.add_dependency(%q<anbt-sql-formatter>, [">= 0"])
    s.add_dependency(%q<awesome_print>, [">= 0"])
  end
end
