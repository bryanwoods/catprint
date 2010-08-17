require 'rubygems'

SPEC = Gem::Specification.new do |s|
  s.name = "catprint"
  s.version = "0.0.1"
  s.author = "Bryan Woods"
  s.email = "bryanwoods4e@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.description = "Ruby wrapper for the CatPrint API"
  s.summary = "Allows Ruby developers to interact with CatPrint's ActionPrint API (http://www.catprint.com/action_print) with pure Ruby."
  s.rubyforge_project = "catprint"
  s.homepage = "http://github.com/bryanwoods/catprint"
  s.files = Dir.glob("**/*")
  s.require_path = "lib"
  s.has_rdoc = false
  s.add_dependency(%q<httparty>, [">= 0.6.1"])
end
