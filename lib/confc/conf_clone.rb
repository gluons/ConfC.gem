require_relative 'copy'

##
# ConfC
module ConfC
  ##
  # Clone given files from given path to current working directory.
  def self.conf_clone(
    files,
    path,
    options = { overwrite: false, verbose: false }
  )
    results = files.map do |file|
      src = File.expand_path(file, path)
      ConfC.copy(src, options)
    end
    results.any? { |result| result } # Return true if any process succeed
  end
end
