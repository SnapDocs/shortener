$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shortener/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shortener"
  s.version     = Shortener::VERSION
  s.authors     = ["Pavel Pachkovsky"]
  s.email       = ["sean@snapdocs.com"]
  s.homepage    = "https://www.github.com/SnapDocs/shortener"
  s.summary     = "shortens stuff"
  s.description = "shortening shortly"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.2.22"
end
