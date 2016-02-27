# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_shawty/version'

Gem::Specification.new do |spec|
  spec.name          = "go_shawty"
  spec.version       = GoShawty::VERSION
  spec.authors       = ["lawrend"]
  spec.email         = ["douglaslawrence314@gmail.com"]

  spec.summary       = "Celebrity Birthdays and a Random 50 Cent Lyric"
  spec.description   = "Enter your birthday and get info on some celebrities who share that bday, the celebrate with a 50 Cent lyric.  Huzzah!"
  spec.homepage      = "https://github.com/lawrend/go-shawty-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"

end
