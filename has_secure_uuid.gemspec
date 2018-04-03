
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_secure_uuid/version'

Gem::Specification.new do |spec|
  spec.name          = 'has_secure_uuid'
  spec.version       = HasSecureUuid::VERSION
  spec.authors       = ['Sander Tuin']
  spec.email         = ['sandergarden@gmail.com']
  spec.summary       = 'Create uniques random uuids for any model in ruby on rails.'
  spec.description   = 'HasSecureUuid provides you an easily way to generate random uuids for any model in ruby on rails. **SecureRandom::uuid** is used to generate a unique uuid, so collisions are highly unlikely.'
  spec.homepage      = 'https://github.com/sndrgrdn/has_secure_uuid'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 3.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
end
