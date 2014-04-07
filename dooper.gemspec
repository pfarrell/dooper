# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dooper/version'

Gem::Specification.new do |spec|
  spec.name          = "dooper"
  spec.version       = Dooper::VERSION
  spec.authors       = ["Pat Farrell"]
  spec.email         = ["pfarrell@realgravity.com"]
  spec.summary       = %q{helper library for interacting with s3 and hadoop}
  spec.description   = %q{helper library for interacting with s3 and hadoop}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "webhdfs" 
  spec.add_dependency 'aws-sdk-core'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
