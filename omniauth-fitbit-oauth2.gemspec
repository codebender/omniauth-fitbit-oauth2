# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-fitbit-oauth2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-fitbit-oauth2'
  gem.version       = OmniAuth::FitbitOauth2::VERSION
  gem.license       = 'MIT'
  gem.summary       = %q{OmniAuth Oauth2 strategy for fitbit.com.}
  gem.description   = %q{OmniAuth Oauth2 strategy for fitbit.com - https://wiki.fitbit.com/display/API/OAuth+2.0}
  gem.author        = 'Matthew Bender'
  gem.email         = 'benderm@gmail.com'
  gem.homepage      = 'https://github.com/codebender/omniauth-fitbit-oauth2'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.3'

  gem.add_development_dependency 'rspec', '~> 3.2'
end
