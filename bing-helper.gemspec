# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bing-helper/version"

Gem::Specification.new do |s|
  s.name        = "bing-helper"
  s.version     = BingHelper::VERSION

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sujal Shah"]
  s.email       = ["codesujal@gmail.com"]
  s.homepage    = "https://github.com/VarioLabs/bing-helper"
  s.summary     = "Bing search API client for EM-Synchrony using Faraday"
  s.description = s.summary
  s.rubyforge_project = "bing-helper"

  s.add_dependency "faraday", ">= 0.7.5"
  s.add_dependency 'yajl-ruby', '~> 1.0'

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
