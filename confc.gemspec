lib = File.expand_path('./lib', File.dirname(__FILE__))

$LOAD_PATH.push lib unless $LOAD_PATH.include?(lib)

require 'confc/version'

DESCRIPTION =
  'Clone your default configuration files to current working directory.'.freeze

Gem::Specification.new do |s|
  s.name = 'confc'
  s.version = ConfC::VERSION
  s.summary = 'Start new project with your default configs.'
  s.description = DESCRIPTION
  s.files = ['confc.gemspec', 'LICENSE', 'Gemfile', 'files.yaml']
  s.files += Dir['*.md', 'bin/*', 'lib/**/*']
  s.executables = ['confc']
  s.required_ruby_version = '>= 2.1.0'
  s.author = 'Saran Tanpituckpong'
  s.license = 'MIT'
  s.homepage = 'https://gluons.github.io/ConfC.gem/'
  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/gluons/ConfC.gem/issues'
  }

  s.add_runtime_dependency 'activesupport', '~> 5.1', '>= 5.1.5'
  s.add_runtime_dependency 'mysticonfig', '~> 0.1.0'
  s.add_runtime_dependency 'rainbow', '~> 3.0'
  s.add_runtime_dependency 'tty-prompt', '~> 0.15.0'

  s.add_development_dependency 'aruba', '~> 0.14.3'
  s.add_development_dependency 'rake', '~> 12.3'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.52.1'
end
