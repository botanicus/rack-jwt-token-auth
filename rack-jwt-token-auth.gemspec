#!/usr/bin/env gem build

Gem::Specification.new do |s|
  s.name              = 'rack-jwt-token-auth'
  s.version           = '0.0.1'
  s.date              = Date.today.to_s
  s.authors           = ['https://github.com/botanicus']
  s.summary           = 'JWT-based token authentication middleware.'
  s.description       = 'JWT-based token authentication middleware for Rack.'
  s.email             = 'james@101ideas.cz'
  s.homepage          = 'https://github.com/botanicus/rack-jwt-token-auth'
  s.rubyforge_project = s.name
  s.license           = 'MIT'

  s.files             = ['README.md', *Dir.glob('**/*.rb')]

  s.add_runtime_dependency('jwt', '~> 0')
  s.add_runtime_dependency('rack', '~> 1')
end
