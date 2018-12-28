
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'princeton_standard_libs/version'

Gem::Specification.new do |spec|
  spec.name          = 'princeton_standard_libs-ruby'
  spec.version       = PrincetonStandardLibs::VERSION
  spec.authors       = ['Gregory Ostermayr']
  spec.email         = ['<gregory.ostermayr@gmail.com>']

  spec.summary       = %q{A pure ruby port of the Princeton standard libraries.}
  spec.description   = %q{A pure ruby port of the Princeton standard libraries.}
  spec.homepage      = 'https://github.com/gregors/princeton_standard_libs-ruby'
  spec.license       = 'GPLv3'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
