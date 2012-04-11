# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ziptastic/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ezekiel Templin"]
  gem.email         = ["zeke@templ.in"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ziptastic"
  gem.require_paths = ["lib"]
  gem.version       = Ziptastic::VERSION
  
  gem.add_dependency("sqlite3", "~> 1.3.5")
  gem.add_development_dependency("rspec", "~> 2.9.0")
end
