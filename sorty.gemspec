# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorty/version'

Gem::Specification.new do |spec|
  spec.name          = "sorty-sorter"
  spec.version       = Sorty::VERSION
  spec.authors       = ["Kat Padilla"]
  spec.email         = ["hello@katpadi.ph"]
  spec.summary       = "This gem sorts ActiveRecord::Relation based on dynamic column (name, updated_at, etc.) and direction (asc, desc) parameters against columns defined in model."
  spec.description   = "This gem adds an ActiveRecord::Relation method that sorts based on dynamic column (name, updated_at, etc.) and direction (asc, desc) parameters and validated against definition in model."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'mysql2', '~> 0.3.18'

  spec.add_dependency "activerecord", "~> 4.1.8"
end