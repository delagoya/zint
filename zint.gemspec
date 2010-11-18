# -*- encoding: utf-8 -*-
require File.expand_path("../lib/zint/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "zint"
  s.version     = Zint::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/zint"
  s.summary     = "TODO: Write a gem summary"
  s.description = "TODO: Write a gem description"

  s.required_rubygems_version = ">= 1.3.7"
  s.rubyforge_project         = "zint"

  s.add_dependency("ffi", "~> 0.6")
  
  s.add_development_dependency "bundler", "~> 1.0"
  s.add_development_dependency "shoulda", "~> 2.11"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
