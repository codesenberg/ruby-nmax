lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'nmax/version'
require 'english'

# rubocop:disable Style/WordArray

Gem::Specification.new do |gem|
  gem.authors       = ['xfynx', 'codesenberg']
  gem.email         = [
    'steewenson.evan@gmail.com',
    'max.faceless.frei@gmail.com'
  ]
  gem.description   = 'simple "n max numbers" extractor from any text data'
  gem.summary       = 'nmax'
  gem.homepage      = 'https://github.com/codesenberg/ruby-nmax'
  gem.license       = 'Nonstandard'

  gem.files = `git ls-files`.split($ORS)
  gem.executables = ['nmax']
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = 'nmax'
  gem.require_paths = ['lib']
  gem.version = NMax::VERSION
  gem.add_development_dependency 'bundler', '~> 1.16'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
end

# rubocop:enable Style/WordArray
