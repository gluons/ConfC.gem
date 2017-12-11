require_relative 'copy'

##
# ConfC
module ConfC
  ##
  # Clone given files from given path to current working directory.
  def self.conf_clone(
    files,
    path,
    options = { verbose: false, overwrite: false }
  )
    files.each do |file|
      src = File.expand_path(file, path)
      ConfC.copy(src, options)
    end
  end
end
