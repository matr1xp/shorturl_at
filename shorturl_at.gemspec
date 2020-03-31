lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "shorturl_at/version"

Gem::Specification.new do |spec|
  spec.name          = "shorturl_at"
  spec.version       = ShorturlAt::VERSION
  spec.authors       = ["Marlon Santos"]
  spec.email         = ["marlonsantos.au@gmail.com"]

  spec.summary       = %q{A simple long URL shortener.}
  spec.description   = %q{Shorten your URLs with this simple url shortener written in Ruby.}
  spec.homepage      = "http://github.com/matr1xp/shorturl_at"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "http://devapps.com.au/gemserver"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency('http', '~> 4.2')
  spec.add_runtime_dependency('nokogiri', '~> 1.10')
end
