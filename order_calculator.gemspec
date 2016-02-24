# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'order_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "order_calculator"
  spec.version       = OrderCalculator::VERSION
  spec.authors       = ["Marco Moura"]
  spec.email         = ["marco.moura@gmail.com"]

  spec.summary       = %q{Order calculator exercise}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = 'exercicio'
  spec.require_paths = ["lib", 'lib/order_calculator']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
