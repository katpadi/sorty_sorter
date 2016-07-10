# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorty_sorter/version'

Gem::Specification.new do |spec|
  spec.name          = "sorty_sorter"
  spec.version       = SortySorter::VERSION
  spec.authors       = ["Kat Padilla"]
  spec.email         = ["hello@katpadi.ph"]
  spec.summary       = %q{ Sorts ActiveRecord::Relation based on dynamic parameters against the attributes defined in model. }
  spec.description   = %q{ This gem adds an ActiveRecord::Relation method that sorts based on dynamic column (i.e. name, updated_at, etc.) and direction (asc, desc) parameters and validated against definition in model. }
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