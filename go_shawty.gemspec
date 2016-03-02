# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_shawty/version'

Gem::Specification.new do |s|
  s.name          = "go_shawty"
  s.version       = GoShawty::VERSION
  s.authors       = ["Douglas Lawrence"]
  s.email         = ["douglaslawrence314@gmail.com"]

  s.summary       = "Celebrity Birthdays and a Random 50 Cent Lyric"
  s.description   = "Enter your birthday and get info on some celebrities who share that bday, the celebrate with a 50 Cent lyric.  Huzzah!"
  s.homepage      = "https://github.com/lawrend/go-shawty-cli-gem"
  s.license       = "MIT"


  s.files         = ["lib/go_shawty.rb", "lib/go_shawty/celebrity_maker.rb", "lib/go_shawty/celebrity_scraper.rb", "lib/go_shawty/cli.rb", "lib/go_shawty/lyric.rb", "config/environment.rb"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.add_dependency "bundler", "~> 1.10"
  s.add_dependency "rake", "~> 10.0"
  s.add_dependency "rs", ">= 0"
  s.add_dependency "pry", ">= 0"
  s.add_dependency "nokogiri", ">= 0"

end
