# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinese_number/version'

Gem::Specification.new do |spec|
  spec.name          = "chinese_number"
  spec.version       = ChineseNumber::VERSION
  spec.authors       = ["Chris Tai"]
  spec.email         = ["jct808@gmail.com"]

  spec.summary       = %q{Convert integers to Traditional Chinese financial numerals.}
  spec.description   = %q{Converts integer amounts to Traditional Chinese financial numerals commonly used on Taiwan banking and accounting documents.}
  spec.homepage      = "https://github.com/jct808/chinese_number"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.10"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency 'minitest', '>= 5.0'

end
