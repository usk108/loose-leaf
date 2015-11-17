# -*- encoding: utf-8 -*-
# stub: elasticsearch-model 0.1.8 ruby lib

Gem::Specification.new do |s|
  s.name = "elasticsearch-model"
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Karel Minarik"]
  s.date = "2015-10-12"
  s.description = "ActiveModel/Record integrations for Elasticsearch."
  s.email = ["karel.minarik@elasticsearch.org"]
  s.extra_rdoc_files = ["README.md", "LICENSE.txt"]
  s.files = ["LICENSE.txt", "README.md"]
  s.homepage = "https://github.com/elasticsearch/elasticsearch-rails/"
  s.licenses = ["Apache 2"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.8"
  s.summary = "ActiveModel/Record integrations for Elasticsearch."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<elasticsearch>, ["> 0.4"])
      s.add_runtime_dependency(%q<activesupport>, ["> 3"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<activemodel>, ["> 3.0"])
      s.add_development_dependency(%q<oj>, [">= 0"])
      s.add_development_dependency(%q<kaminari>, [">= 0"])
      s.add_development_dependency(%q<will_paginate>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.2"])
      s.add_development_dependency(%q<shoulda-context>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<turn>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<ci_reporter>, ["~> 1.9"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<cane>, [">= 0"])
      s.add_development_dependency(%q<require-prof>, [">= 0"])
    else
      s.add_dependency(%q<elasticsearch>, ["> 0.4"])
      s.add_dependency(%q<activesupport>, ["> 3"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<activemodel>, ["> 3.0"])
      s.add_dependency(%q<oj>, [">= 0"])
      s.add_dependency(%q<kaminari>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.2"])
      s.add_dependency(%q<shoulda-context>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<turn>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<ruby-prof>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<ci_reporter>, ["~> 1.9"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<cane>, [">= 0"])
      s.add_dependency(%q<require-prof>, [">= 0"])
    end
  else
    s.add_dependency(%q<elasticsearch>, ["> 0.4"])
    s.add_dependency(%q<activesupport>, ["> 3"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<elasticsearch-extensions>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<activemodel>, ["> 3.0"])
    s.add_dependency(%q<oj>, [">= 0"])
    s.add_dependency(%q<kaminari>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.2"])
    s.add_dependency(%q<shoulda-context>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<turn>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<ruby-prof>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<ci_reporter>, ["~> 1.9"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<cane>, [">= 0"])
    s.add_dependency(%q<require-prof>, [">= 0"])
  end
end
