require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require File.join(File.dirname(__FILE__), 'lib', 'salty_slugs', 'version')

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the slug plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the slug plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Slug'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "galetahub-salty_slugs"
    s.version = SaltySlugs::VERSION
    s.summary = "Generated slugs"
    s.description = "Abstraction of word-based slugs for URLs, w/ or w/o leading numeric IDs."
    s.email = "galeta.igor@gmail.com"
    s.homepage = "https://github.com/galetahub/salty_slugs"
    s.authors = ["Igor Galeta", "Pavlo Galeta"]
    s.files =  FileList["[A-Z]*", "lib/**/*"]
    s.extra_rdoc_files = FileList["[A-Z]*"] - %w(Rakefile)
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
