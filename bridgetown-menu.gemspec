# frozen_string_literal: true

require_relative "lib/bridgetown-menu/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-menu"
  spec.version       = BridgetownMenu::VERSION
  spec.author        = "Bridgetown Team"
  spec.email         = "maintainers@bridgetownrb.com"
  spec.summary       = "A Bridgetown plugin and Ruby component for defining and rendering navigation menus"
  spec.homepage      = "https://github.com/bridgetownrb/bridgetown-menu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "bridgetown", ">= 0.21.0.beta3", "< 2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.2"
end
