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
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    #f.match(%r{^(test|spec|features)/})
  #end
  spec.files         = `git ls-files`.split($\).reject{|f| f =~ /(\.gemspec)/ }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency 'rails', '>= 4.0', '< 5.2'
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
