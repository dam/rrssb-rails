# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rrssb/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "rrssb-rails"
  spec.version       = Rrssb::Rails::VERSION
  spec.authors       = ["Damien Imberdis"]
  spec.email         = ["imberdis.damien@gmail.com"]
  spec.summary       = 'Ridiculously Responsive Social Sharing Buttons for Rails'
  spec.description   = 'Ridiculously Responsive Social Sharing Buttons for Rails is based on RRSSB from KNI Labs'
  spec.homepage      = 'https://github.com/Merchbro/rrssb-rails'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 3.2'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
