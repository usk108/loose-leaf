# -*- encoding: utf-8 -*-
# stub: faker-japanese 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "faker-japanese"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["tily"]
  s.date = "2011-09-29"
  s.description = "Faker in Japanese"
  s.email = "tily05@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "LICENSE.naist-jdic", "README.md"]
  s.files = ["LICENSE", "LICENSE.naist-jdic", "README.md"]
  s.homepage = "http://github.com/tily/ruby-faker-japanese"
  s.rubygems_version = "2.4.8"
  s.summary = "Faker in Japanese"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
