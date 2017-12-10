lib = File.expand_path('./lib', File.dirname(__FILE__))

$LOAD_PATH.push lib unless $LOAD_PATH.include?(lib)

require 'confc/version'

Gem::Specification.new do |s|
  s.name = 'confc'
  s.version = ConfC::VERSION
  s.summary = 'Start new project with your default configs.'
  s.description = 'Clone your default configuration files to current working directory.'
  s.files = %w(confc.gemspec LICENSE Gemfile) + Dir['*.md', 'bin/*', 'lib/**/*']
  s.executables = ['confc']
  s.author = 'Saran Tanpituckpong'
  s.license = 'MIT'
  s.homepage = 'https://github.com/gluons/ConfC.gem'
  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/gluons/ConfC.gem/issues'
  }

  s.add_runtime_dependency 'thor', '~> 0.20.0'

  s.add_development_dependency 'rubocop', '~> 0.51.0'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rspec', '~> 3.7'
end
