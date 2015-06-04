$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require "espial/version"

Gem::Specification.new do |spec|
  spec.name         = Espial::NAME
  spec.version      = Espial::VERSION
  spec.summary      = ''
  spec.description  = ''
  spec.licenses     = ['Apache-2.0']
  spec.platform     = Gem::Platform::RUBY
  spec.authors      = [Espial::AUTHOR]
  spec.email        = [Espial::EMAIL]
  spec.homepage     = Espial::WEBSITE

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "README.md"]

  spec.add_dependency 'rails', '~> 4'
  spec.add_dependency 'json-schema', '~> 2.5.1'
end
