# frozen_string_literal: true

require_relative "lib/apirelio/rails/version"

Gem::Specification.new do |spec|
  spec.name = "apirelio-rails"
  spec.version = Apirelio::Rails::VERSION
  spec.authors = ["Apirelio"]
  spec.email = ["info@apirelio.com"]
  spec.summary = "Customer-aware API analytics for Ruby on Rails."
  spec.description = "Automatic, fail-safe Apirelio request instrumentation for Rails API applications."
  spec.homepage = "https://apirelio.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"
  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/pryznar/apirelio-rails",
    "changelog_uri" => "https://github.com/pryznar/apirelio-rails/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://apirelio.com/docs/ruby/rails",
    "rubygems_mfa_required" => "true"
  }
  spec.files = Dir["CHANGELOG.md", "LICENSE", "README.md", "lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "apirelio", ">= 0.1.0", "< 0.2.0"
  spec.add_dependency "railties", ">= 7.1", "< 9"
  spec.add_development_dependency "actionpack", ">= 7.1", "< 9"
  spec.add_development_dependency "minitest", ">= 5.20", "< 6"
  spec.add_development_dependency "rake", ">= 13.1", "< 14"
end
