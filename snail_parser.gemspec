$:.unshift File.expand_path('../lib', __FILE__)
require 'snail_parser/version'

Gem::Specification.new do |s|
  s.authors               = 'alpaca-tc'
  s.date                  = Time.now.strftime('%Y-%m-%d')
  s.email                 = 'alpaca-tc@alpaca.tc'

  s.files                 = `git ls-files -- lib/*`.split("\n")
  s.files                += %w[LICENSE README.md]

  s.test_files            = `git ls-files -- spec/*`.split("\n")

  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.homepage              = 'https://github.com/alpaca-tc/snail_parser'
  s.license               = 'MIT'
  s.name                  = 'snail_parser'
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 2.0.0'
  s.version               = SnailParser::Version

  s.summary               = ''
  s.description           = ''

  s.add_dependency 'json'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
