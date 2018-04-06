lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nmax/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Anton"]
  gem.email         = ["lsteewenson.evan@gmail.com"]
  gem.description   = %q{simple "n max numbers" extractor from any text data}
  gem.summary       = %q{Now zerp it..Into shape}
  gem.homepage      = "TODO: public repo"

  gem.files = `git ls-files`.split($\)
  gem.executables = ["nmax"]
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = "nmax"
  gem.require_paths = ["lib"]
  gem.version = Nmax::VERSION
  gem.add_development_dependency "bundler", "~> 1.16"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec", "~> 3.0"
end