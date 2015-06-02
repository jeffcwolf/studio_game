Gem::Specification.new do |s|
  s.name         = "jcw_studio_game"
  s.version      = "1.0.0"
  s.author       = "Jeff Wolf"
  s.email        = "jeff@example.com"
  s.homepage     = "http://www.rubygems.org"
  s.summary      = "INSERT SUMMARY HERE"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.md README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end
