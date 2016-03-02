# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_shawty/version'

Gem::Specification.new do |spec|
  spec.name          = "go_shawty"
  spec.version       = GoShawty::VERSION
  spec.authors       = ["Douglas Lawrence"]
  spec.email         = ["douglaslawrence314@gmail.com"]

  spec.summary       = "Celebrity Birthdays and a Random 50 Cent Lyric"
  spec.description   = "Enter your birthday and get info on some celebrities who share that bday, the celebrate with a 50 Cent lyric.  Huzzah!"
  spec.homepage      = "https://github.com/lawrend/go-shawty-cli-gem"
  spec.license       = "MIT"


  spec.files         = ["lib/go_shawty.rb", "lib/go_shawty/celebrity_maker.rb", "lib/go_shawty/celebrity_scraper.rb", "lib/go_shawty/cli.rb", "lib/go_shawty/lyric.rb"]
  spec.executables   << 'go_shawty'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"

end
