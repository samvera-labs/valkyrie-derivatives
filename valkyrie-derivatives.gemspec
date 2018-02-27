
# frozen_string_literal: true
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "valkyrie/derivatives/version"

Gem::Specification.new do |spec|
  spec.name          = "valkyrie-derivatives"
  spec.version       = Valkyrie::Derivatives::VERSION
  spec.authors       = ["Trey Pendragon"]
  spec.email         = ["tpendragon@princeton.edu"]

  spec.summary       = 'Hydra::Derivatives support for Valkyrie'
  spec.description   = 'Adds patterns for derivative and characterization registration in Valkyrie.'
  spec.homepage      = "https://github.com/samvera-labs/valkyrie-derivatives"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "bixby"
end
