# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "view_component/version"

Gem::Specification.new do |spec|
  spec.name          = "view_component"
  spec.version       = ViewComponent::VERSION::STRING
  spec.authors       = ["GitHub Open Source"]
  spec.email         = ["opensource+view_component@github.com"]

  spec.summary       = %q{View components for Rails}
  spec.homepage      = "https://github.com/github/view_component"
  spec.license       = "MIT"

  spec.files         = Dir["LICENSE.txt", "README.md", "docs/CHANGELOG.md", "lib/**/*"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_runtime_dependency     "activesupport", [">= 2.3.0", "< 3.0"]
end
