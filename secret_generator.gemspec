# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secret_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "secret_generator"
  spec.version       = SecretGenerator::VERSION
  spec.authors       = ["0xfffffff7"]
  spec.email         = ["0xfffffff7@gmail.com"]

  spec.summary       = %q{secret_generator can easily create a self-signed certificate. }
  spec.description   = %q{}
  spec.homepage      = "https://github.com/0xfffffff7/secret_generator"

  spec.files         = ['bin/secret_generator']
  #spec.bindir        = "exe"
  spec.executables   = ['secret_generator']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
