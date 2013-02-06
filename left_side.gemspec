# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'left_side/version'

Gem::Specification.new do |gem|
  gem.name          = "left_side"
  gem.version       = LeftSide::VERSION
  gem.authors       = ["soffolk"]
  gem.email         = ["zlx.star@gmail.com"]
  gem.description   = %q{It provide left_side and highlight function web app, base on cells and for rails app}
  gem.summary       = %q{left_side and highlight}
  gem.homepage      = "https://github.com/zlx/left_side"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "cells",    "~> 3.7.1"
  gem.add_dependency "rails",    "~> 3.2.6"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "capybara"
  gem.add_development_dependency "sass"
  gem.add_development_dependency "uglifier"
  gem.add_development_dependency "therubyracer"

  gem.add_development_dependency "launchy"
  gem.add_development_dependency "debugger"
end
