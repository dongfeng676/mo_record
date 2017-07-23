# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mo_record/version"

Gem::Specification.new do |spec|
  spec.name          = "mo_record"
  spec.version       = MoRecord::VERSION
  spec.authors       = ["zhangmingju"]
  spec.email         = ["1417278284@qq.com"]

  spec.summary       = %q{log activerecord model version}
  spec.description   = %q{log activerecord model version}
  spec.homepage      = "https://github.com/zhangmingju/mo_record"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\).reject{|f| f =~ /(\.gemspec)/ }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency 'rails', '>= 4.0', '< 5.2'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
