# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'next_bus/version'

Gem::Specification.new do |gem|
  gem.name          = "next_bus"
  gem.version       = NextBus::VERSION
  gem.authors       = ["Dave Elliott"]
  gem.email         = ["ddazza@gmail.com"]
  # gem.description   = ''
  gem.summary       = 'Ouputs the time until the next bus'
  gem.homepage      = "https://github.com/DDAZZA/next_bus.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
