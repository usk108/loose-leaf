# -*- encoding: utf-8 -*-
# stub: test-queue 0.2.13 ruby lib

Gem::Specification.new do |s|
  s.name = "test-queue"
  s.version = "0.2.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aman Gupta"]
  s.date = "2015-05-14"
  s.description = "minitest/rspec parallel test runner for CI environments"
  s.email = "ruby@tmm1.net"
  s.executables = ["rspec-queue", "minitest-queue", "testunit-queue", "cucumber-queue"]
  s.files = ["bin/cucumber-queue", "bin/minitest-queue", "bin/rspec-queue", "bin/testunit-queue"]
  s.homepage = "http://github.com/tmm1/test-queue"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "parallel test runner"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["< 4.0", ">= 2.13"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.3.10"])
    else
      s.add_dependency(%q<rspec>, ["< 4.0", ">= 2.13"])
      s.add_dependency(%q<cucumber>, ["~> 1.3.10"])
    end
  else
    s.add_dependency(%q<rspec>, ["< 4.0", ">= 2.13"])
    s.add_dependency(%q<cucumber>, ["~> 1.3.10"])
  end
end
