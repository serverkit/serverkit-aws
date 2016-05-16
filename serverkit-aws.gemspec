lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "serverkit/aws/version"

Gem::Specification.new do |spec|
  spec.name          = "serverkit-aws"
  spec.version       = Serverkit::Aws::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Serverkit plug-in for Amazon Web Services (AWS)."
  spec.homepage      = "https://github.com/serverkit/serverkit-s3"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", ">= 4.0.2"
  spec.add_runtime_dependency "aws-sdk", "~> 2"
  spec.add_runtime_dependency "serverkit", ">= 0.6.7"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
