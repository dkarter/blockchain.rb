# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blockchain/version'

Gem::Specification.new do |spec|
  spec.name          = 'blockchain'
  spec.version       = Blockchain::VERSION
  spec.authors       = ['Dorian Karter']
  spec.email         = ['dkarter@gmail.com']

  spec.summary       = <<-SUMMARY
  A naïve implementation of a blockchain data structure.
  For educational purposes only.
  SUMMARY
  spec.description = <<-DESCRIPTION
  This library implements a simple blockchain data structure as a proof of
  concept and as part of a coursera course I am taking about cryptocurrencies
  and the blockchain
  DESCRIPTION
  spec.homepage      = 'http://doriankarter.com'
  spec.license       = 'apache'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.45'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
end
