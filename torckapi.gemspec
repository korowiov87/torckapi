$:.unshift "lib"
require 'torckapi/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Krupenik"]
  gem.email         = ["dennis@krupenik.com"]
  gem.description   = %q{torrent tracker api}
  gem.summary       = %q{torckapi is a tool for quering torrent trackers}
  gem.homepage      = "https://github.com/krupenik/torckapi"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "torckapi"
  gem.require_paths = ["lib"]
  gem.version       = Torckapi::VERSION

  gem.licenses      = ["MIT"]

  gem.add_development_dependency 'rake', '>= 0'
  gem.add_development_dependency 'minitest', '>= 0'

  gem.add_runtime_dependency 'bencode', '>= 0'
end
