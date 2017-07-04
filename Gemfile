source 'https://geminabox.klaxoon.com'

group :development, :test do
  gem 'json'
  gem 'metadata-json-lint'
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
  gem 'rake'
  gem 'rspec-puppet'
  gem 'r10k'
  gem 'r10k'
  gem 'rubocop'
  gem 'generate-puppetfile'
  gem "puppet-lint-absolute_classname-check"
  gem "puppet-lint-leading_zero-check"
  gem "puppet-lint-trailing_comma-check"
  gem "puppet-lint-version_comparison-check"
  gem "puppet-lint-classes_and_types_beginning_with_digits-check"
  gem "puppet-lint-unquoted_string-check"
  gem 'puppet-lint-resource_reference_syntax'
  gem 'docker-api'
  gem 'beaker'
  gem 'rspec-puppet-facts'
  gem 'simplecov'
  gem 'simplecov-console'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
      gem 'puppet', puppetversion
else
      gem 'puppet'
end

# vim:ft=ruby
