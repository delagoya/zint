require 'bundler'
Bundler::GemHelper.install_tasks
require 'rake'
require 'rake/testtask'
require 'yard'

Rake::TestTask.new do |t|
  t.libs << 'lib' << 'test'
  t.pattern =   'test/*_test.rb'
  t.verbose = false
end

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', "README.rdoc"]   # optional
  t.options = ['--any', '--extra', '--opts'] # optional
end