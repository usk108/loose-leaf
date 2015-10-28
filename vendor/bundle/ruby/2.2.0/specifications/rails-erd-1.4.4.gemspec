# -*- encoding: utf-8 -*-
# stub: rails-erd 1.4.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-erd"
  s.version = "1.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Rolf Timmermans"]
  s.date = "2015-10-15"
  s.description = "Automatically generate an entity-relationship diagram (ERD) for your Rails models."
  s.email = ["r.timmermans@voormedia.com"]
  s.executables = ["erd"]
  s.files = ["bin/erd"]
  s.homepage = "https://github.com/voormedia/rails-erd"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubygems_version = "2.4.8"
  s.summary = "Entity-relationship diagram for your Rails models."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.2"])
      s.add_runtime_dependency(%q<ruby-graphviz>, ["~> 1.2"])
      s.add_runtime_dependency(%q<choice>, ["~> 0.2.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.2"])
      s.add_dependency(%q<activesupport>, [">= 3.2"])
      s.add_dependency(%q<ruby-graphviz>, ["~> 1.2"])
      s.add_dependency(%q<choice>, ["~> 0.2.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.2"])
    s.add_dependency(%q<activesupport>, [">= 3.2"])
    s.add_dependency(%q<ruby-graphviz>, ["~> 1.2"])
    s.add_dependency(%q<choice>, ["~> 0.2.0"])
  end
end
