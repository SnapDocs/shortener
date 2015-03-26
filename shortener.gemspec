$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shortener/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shortener"
  s.version     = Shortener::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Shortener."
  s.description = "TODO: Description of Shortener."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.21"
end
