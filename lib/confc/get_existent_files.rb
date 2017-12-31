##
# ConfC
module ConfC
  ##
  # Get the existent files at given path from all file list.
  def self.get_existent_files(path, all_files)
    if all_files.is_a?(Array)
      all_files.select do |file|
        file_path = File.expand_path(file, path)
        File.exist?(file_path)
      end
    else
      []
    end
  end
end
