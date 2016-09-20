$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activeadmin_custom_layout/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin_custom_layout"
  s.version     = ActiveadminCustomLayout::VERSION
  s.authors     = ["ByS Sistemas de Control"]
  s.email       = ["info@bys-control.com.ar"]
  s.homepage    = "https://github.com/bys-control/activeadmin_custom_layout"
  s.summary     = "Extracts ActiveAdmin page components as independent content_for tags to use in regular application layouts"
  s.description = "This gem extracts ActiveAdmin page components as content_for tags using rails CaptureHelper. You can then use those tags to customize application layout as with any non-ActiveAdmin Rails application."
  s.license     = "MIT"

  s.files = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "activeadmin", ">= 1.0.0.pre4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "devise", "~> 4.2.0"
  s.add_development_dependency "pry", "~> 0.10.4"
  s.add_development_dependency "pry-byebug", "~> 3.4.0"

  s.add_development_dependency 'web-console'
  s.add_development_dependency 'listen', '~> 3.0.5'
  s.add_development_dependency 'spring'
  s.add_development_dependency 'spring-watcher-listen', '~> 2.0.0'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'annotate'
  s.add_development_dependency 'awesome_print'

end
