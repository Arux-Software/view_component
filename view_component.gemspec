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
  spec.add_runtime_dependency     "method_source", "~> 1.0"
  spec.add_development_dependency "benchmark-ips", "~> 2.8.2"
  spec.add_development_dependency "better_html", "~> 1"
  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "erb_lint", "~> 0.0.37"
  spec.add_development_dependency "minitest", "= 5.6.0"
  spec.add_development_dependency "pry", "~> 0.13"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop-github", "~> 0.16.1"
  spec.add_development_dependency "simplecov", "~> 0.18.0"
  spec.add_development_dependency "simplecov-console", "~> 0.7.2"
  spec.add_development_dependency "yard", "~> 0.9.25"
  spec.add_development_dependency "yard-activesupport-concern"
end
