# -*- encoding: utf-8 -*-
# stub: choice 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "choice"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Grant Austin", "Chris Wanstrath"]
  s.date = "2014-12-31"
  s.description = "Choice is a simple little gem for easily defining and parsing command line options with a friendly DSL."
  s.email = ["gaustin@gmail.com", "chris@ozmm.org"]
  s.homepage = "http://www.github.com/defunkt/choice"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Choice is a command line option parser."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<test-unit>, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<test-unit>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<test-unit>, ["~> 3.0"])
  end
end
