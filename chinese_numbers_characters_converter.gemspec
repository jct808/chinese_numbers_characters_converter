# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinese_numbers_characters_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "chinese_numbers_characters_converter"
  spec.version       = ChineseNumbersCharactersConverter::VERSION
  spec.authors       = ["Chris Tai"]
  spec.email         = ["jct808@gmail.com"]

  spec.summary       = %q{To Convert a Integer to Chinese Number Characters.}
  spec.description   = %q{In Taiwan, Bank or other finance facility are using Chinese numerals character substitute for Arabic numerals, because of security and correctly reason.}
  spec.homepage      = "https://rubygems.org/gems/example"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/gems/example"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 0'

end
