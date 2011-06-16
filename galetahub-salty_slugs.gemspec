# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{galetahub-salty_slugs}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Igor Galeta", "Pavlo Galeta"]
  s.date = %q{2011-06-16}
  s.description = %q{Abstraction of word-based slugs for URLs, w/ or w/o leading numeric IDs.}
  s.email = %q{galeta.igor@gmail.com}
  s.extra_rdoc_files = [
    "MIT-LICENSE",
    "README.markdown"
  ]
  s.files = [
    "MIT-LICENSE",
    "README.markdown",
    "Rakefile",
    "lib/salty_slugs.rb",
    "lib/salty_slugs/active_record.rb",
    "lib/salty_slugs/railtie.rb",
    "lib/salty_slugs/transliteration.rb",
    "lib/salty_slugs/utils.rb",
    "lib/salty_slugs/version.rb"
  ]
  s.homepage = %q{https://github.com/galetahub/salty_slugs}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Generated slugs}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

