#!/usr/bin/env gem build
# encoding: utf-8

require "base64"

Gem::Specification.new do |s|
  s.name = "seed_dumper"
  s.version = "0.0.1"
  s.authors = ["Kevin Edwards"]
  s.homepage = "http://github.com/kevTheDev/seed_dumper"
  s.summary = "Create seed files for each model from your database data"
  s.description = "#{s.summary}."
  s.cert_chain = nil
  s.email = "kev.j.edwards@gmail.com"
  s.has_rdoc = true
 
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG.rdoc",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/seed_dump.rb",
    "lib/seed_dump/railtie.rb",
    "lib/seed_dump/seed_dumper.rb",
    "lib/tasks/seed_dump.rake",
    "seed_dumper.gemspec",
    "test/seed_dump_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/kevTheDev/seed_dumper}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{{Seed Dumper for Rails}}
  s.test_files = [
    "test/seed_dump_test.rb",
    "test/test_helper.rb"
  ]


  begin
    require "changelog"
  rescue LoadError
    warn "You have to have changelog gem installed for post install message"
  else
    s.post_install_message = CHANGELOG.new.version_changes
  end
end
