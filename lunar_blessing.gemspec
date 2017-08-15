# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lunar_blessing/version'

Gem::Specification.new do |spec|
  spec.name          = "lunar_blessing"
  spec.version       = LunarBlessing::VERSION
  spec.authors       = ["Terry Tai"]
  spec.email         = ["poshboytl@gmail.com"]

  spec.summary       = %q{Lunar calendar, Solar calendar convertor}
  spec.description   = %q{Lunar calendar, Solar calendar convertor}
  spec.homepage      = "https://github.com/mycolorway/lunar_blessing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
