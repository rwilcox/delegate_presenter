# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "delegate_presenter/version"

Gem::Specification.new do |s|
  s.name        = "delegate_presenter"
  s.version     = DelegatePresenter::VERSION
  s.authors     = ["Ryan Wilcox"]
  s.email       = ["rwilcox@wilcoxd.com"]
  s.homepage    = ""
  s.summary     = %q{A simple Superclass for your Presenters, using SimpleDelegator}
  s.description = %q{Presenters are easier with delegators, and other friends}

  s.rubyforge_project = "delegate_presenter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "rails"
  # s.add_runtime_dependency "rest-client"
end
