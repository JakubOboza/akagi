# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'akagi/version'

Gem::Specification.new do |gem|
  gem.name          = "akagi"
  gem.version       = Akagi::VERSION
  gem.authors       = ["JakubOboza"]
  gem.email         = ["jakub.oboza@gmail.com"]
  gem.description   = %q{Simple Midway game-server client library}
  gem.summary       = %q{Simple battleships "Midway" server client that can be used to prototype fast your own game without handling billions of random stuff}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
