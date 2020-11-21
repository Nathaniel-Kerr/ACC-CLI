require_relative 'lib/acc_about/version'

Gem::Specification.new do |spec|
  spec.name          = "acc_about"
  spec.version       = AccAbout::VERSION
  spec.authors       = ["Nathaniel-Kerr"]
  spec.email         = ["NathanielKerr10@gmail.com"]

  spec.summary       = %q{about info regarding alderwood community church.}
  spec.description   = %q{flatiron cli project}
  spec.homepage      = "http://www.homepage.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.homepage.com"
  spec.metadata["changelog_uri"] = "http://www.homepage.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
