require_relative "lib/analytic/version"

Gem::Specification.new do |spec|
  spec.name        = "analytic"
  spec.version     = Analytic::VERSION
  spec.authors     = ["Kevin Sylvestre"]
  spec.email       = ["kevin@ksylvest.com"]
  spec.homepage    = "https://github.com/ksylvest/analytic"
  spec.summary     = "An easy way to track analytics in your app."
  spec.description = "An easy way to track analytics in your app."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.4"
end
