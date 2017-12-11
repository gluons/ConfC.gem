require 'yaml'

##
# ConfC
module ConfC
  ##
  # Get list of file to be copied.
  def self.files
    files_path = File.expand_path('../../files.yaml', File.dirname(__FILE__))
    if File.exist?(files_path)
      YAML.load_file(files_path)
    else
      []
    end
  end
end
