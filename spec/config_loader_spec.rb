require 'confc/load_config'

EXPECTED_CONFIG = {
  path: '../src',
  files: %w[a b c d],
  overwrite: false,
  verbose: false,
  yes: false
}.freeze

RSpec.describe 'Load config' do
  before(:all) do
    Dir.chdir(File.expand_path('./fixtures/config', File.dirname(__FILE__)))
  end

  it 'should load expected config' do
    config = ConfC.load_config
    expect(config).to eql EXPECTED_CONFIG
  end
end
