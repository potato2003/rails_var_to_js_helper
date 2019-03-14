$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_var_to_js_helper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails_var_to_js_helper"
  spec.version     = RailsVarToJsHelper::VERSION
  spec.authors     = ["potato2003"]
  spec.email       = ["potato2003@gmail.com"]
  spec.homepage    = "https://github.com/potato2003/rails_var_to_js_helper"
  spec.summary     = "Pass the rails variable to javascript"
  spec.description = "Pass the rails variable to javascript"
  spec.license     = "MIT"
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.0"
  spec.add_development_dependency "sqlite3"
end
