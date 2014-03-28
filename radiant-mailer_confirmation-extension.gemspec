# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-mailer_confirmation-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-mailer_confirmation-extension"
  s.version     = RadiantMailerConfirmationExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantMailerConfirmationExtension::AUTHORS
  s.email       = RadiantMailerConfirmationExtension::EMAIL
  s.homepage    = RadiantMailerConfirmationExtension::URL
  s.summary     = RadiantMailerConfirmationExtension::SUMMARY
  s.description = RadiantMailerConfirmationExtension::DESCRIPTION

  # Define gem dependencies here.
  # Don't include a dependency on radiant itself: it causes problems when radiant is in vendor/radiant.
  # s.add_dependency "something", "~> 1.0.0"
  s.add_dependency "radiant-mailer-extension"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end
