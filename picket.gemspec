# frozen_string_literal: true

require_relative "lib/picket/version"

version = Picket.version

Gem::Specification.new do |spec|
  spec.name        = "picket"
  spec.version     = version
  spec.authors     = ["Tony Burns"]
  spec.email       = ["tony@tonyburns.net"]
  spec.homepage    = "https://picketengine.org"
  spec.summary     = "Identity and access management engine for Rails."
  spec.description = "Identity and access management engine for Rails."
  spec.license     = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/picketengine/picket/issues",
    "changelog_uri" => "https://github.com/picketengine/picket/blob/v#{version}/CHANGELOG.md",
    "documentation_uri" => "https://api.picketengine.org/v#{version}/",
    "mailing_list_uri" => "https://github.com/picketengine/picket/discussions",
    "source_code_uri" => "https://github.com/picketengine/picket/tree/v#{version}",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir[
    "app/**/*", "config/**/*", "db/**/*", "lib/**/*",
    "CHANGELOG.md", "MIT-LICENSE", "README.md", "SECURITY.md"
  ]
  spec.require_path = "lib"

  spec.required_ruby_version = ">= 3.2.0"
  spec.required_rubygems_version = ">= 3.4.1"

  rails_version = "8.0.0"
  spec.add_dependency "actionmailer", ">= #{rails_version}"
  spec.add_dependency "actionpack", ">= #{rails_version}"
  spec.add_dependency "activejob", ">= #{rails_version}"
  spec.add_dependency "activemodel", ">= #{rails_version}"
  spec.add_dependency "activerecord", ">= #{rails_version}"
  spec.add_dependency "activesupport", ">= #{rails_version}"
  spec.add_dependency "railties", ">= #{rails_version}"

  # spec.add_dependency 'argon2', '~> 2.3'
  # spec.add_dependency 'jwt', '~> 2.9'
  # spec.add_dependency 'platform_agent'
  # spec.add_dependency 'rotp'
  # spec.add_dependency 'rqrcode'
  # spec.add_dependency 'useragent'

  spec.add_dependency "bundler", ">= 1.15.0"
end
