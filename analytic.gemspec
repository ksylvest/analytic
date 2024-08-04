# frozen_string_literal: true

require_relative 'lib/analytic/version'

Gem::Specification.new do |spec|
  spec.name        = 'analytic'
  spec.version     = Analytic::VERSION
  spec.authors     = ['Kevin Sylvestre']
  spec.email       = ['kevin@ksylvest.com']
  spec.homepage    = 'https://github.com/ksylvest/analytic'
  spec.summary     = 'Analytic'
  spec.description = 'Analytic'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>= 3.3.0'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.glob('{app,bin,config,db,lib}/**/*') + %w[README.md Rakefile LICENSE]

  spec.add_dependency 'rails'
end
