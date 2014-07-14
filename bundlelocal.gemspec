# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundlelocal/version'

Gem::Specification.new do |spec|
  spec.name          = "bundlelocal"
  spec.version       = Bundlelocal::VERSION
  spec.authors       = ["Matt Conway"]
  spec.email         = ["matt@conwaysplace.com"]
  spec.summary       = %q{Wrapper for bundler that makes gems local for better interop with rubymine}
  spec.description   = %q{Wrapper for bundler that makes gems local for better interop with rubymine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"
  spec.add_dependency "clamp"

  spec.add_development_dependency "rake"
end
