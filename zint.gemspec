# -*- encoding: utf-8 -*-
require File.expand_path("../lib/zint/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "zint"
  s.version     = Zint::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Angel Pizarro"
  s.email       = "delagoya@gmail.com"
  s.homepage    = "http://rubygems.org/gems/zint"
  s.summary     = "Ruby FFI wrapper on Zint barcode library"
  s.description = "Ruby FFI wrapper on Zint barcode library. See README for more details"
  s.license     = "MIT"
  s.required_rubygems_version = ">= 2"
  s.rubyforge_project         = "zint"

  s.add_dependency("ffi", "~> 1.2")
  
  s.add_development_dependency "bundler", "~> 1.17"
  s.add_development_dependency "shoulda", "~> 3.6"
  s.add_development_dependency "yard"

  s.files        = `git ls-files`.split("\n")
  # s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'

  # YARD documentation
  s.metadata["yard.run"] = "yri"

end
