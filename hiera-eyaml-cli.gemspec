lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hiera/backend/eyaml/encryptors/cli/version'

Gem::Specification.new do |gem|
  gem.name          = 'hiera-eyaml-cli'
  gem.version       = Hiera::Backend::Eyaml::Encryptors::Cli::VERSION
  gem.description   = 'cli encryptor for use with hiera-eyaml'
  gem.summary       = 'Encryption plugin for hiera-eyaml backend for Hiera'
  gem.author        = 'Ethan Smith'
  gem.license       = 'MIT'

  gem.homepage      = 'http://github.com/ethanhs/hiera-eyaml-cli'
  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency('hiera-eyaml', '>=1.3.8')
end
