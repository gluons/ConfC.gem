require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:lint)
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

desc 'Run lint & spec task'
task default: %w[lint spec]
