$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activeadmin_custom_layout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin_custom_layout"
  s.version     = ActiveadminCustomLayout::VERSION
  s.authors     = ["ByS Sistemas de Control"]
  s.email       = ["info@bys-control.com.ar"]
  s.homepage    = "TODO"
  s.summary     = "Extracts ActiveAdmin page components as independent content_for tags to use in regular application layouts"
  s.description = "This gem extracts ActiveAdmin page components as content_for tags using rails CaptureHelper. You can then use those tags to customize application layout as with any non-ActiveAdmin Rails application."
  s.license     = "MIT"

  s.files = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "activeadmin"

  s.add_development_dependency "sqlite3"
end
