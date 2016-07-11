# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorty_sorter/version'

Gem::Specification.new do |spec|
  spec.name          = "sorty_sorter"
  spec.version       = SortySorter::VERSION
  spec.authors       = ["Kat Padilla"]
  spec.email         = ["hello@katpadi.ph"]
  spec.summary       = %q{ This gem sorts AR collection when given a set of parameters that will be validated against the whitelisted attributes in the model. }
  spec.description   = %q{ This gem sorts AR collection when given a set of parameters that will be validated against the whitelisted attributes in the model. The gem mixed in a `sorty_sort` method in the ActiveRecord::Relation. }
  spec.homepage      = "https://github.com/katpadi/sorty_sorter"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'mysql2', '~> 0.3'

  spec.add_dependency "activerecord", "~> 4.1"
end