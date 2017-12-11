require 'fileutils'

require_relative 'display_verbose'
require_relative 'gethome'

##
# ConfC
module ConfC
  ##
  # Copy given file to current working directory.
  def self.copy(src, options = { verbose: false, overwrite: false })
    return unless File.exist?(src)

    FileUtils.copy(src, Dir.pwd)

    dest = File.expand_path(File.basename(src), Dir.pwd)
    ConfC.display_verbose(src, dest) if options[:verbose]
  end
end
