require 'fileutils'

Aruba.configure do |config|
  config.working_directory = 'spec/fixtures/cli'
end

##
# Clean existing cloned files
def clean_test
  FileUtils.rm Dir.glob('spec/fixtures/cli/*'), force: true
  FileUtils.touch 'spec/fixtures/cli/.gitkeep'
end

RSpec.describe 'Run `confc` command', type: :aruba do
  before(:each) do
    clean_test
    run('confc -y -p ../src a c')
  end
  after(:all) { clean_test }

  let(:file_a) { 'a' }
  let(:file_b) { 'b' }
  let(:file_c) { 'c' }
  let(:file_d) { 'd' }
  let(:content_a) { 'a' }
  let(:content_c) { 'c' }

  it 'should run an expected command' do
    expect(last_command_stopped.commandline).to eq 'confc -y -p ../src a c'
  end

  it 'should have expected files' do
    expect(file_a).to be_an_existing_file
    expect(file_c).to be_an_existing_file
  end

  it 'should not have other files' do
    expect(file_b).not_to be_an_existing_file
    expect(file_d).not_to be_an_existing_file
  end

  it 'should have expected content in files' do
    expect(file_a).to have_file_content content_a
    expect(file_c).to have_file_content content_c
  end
end
