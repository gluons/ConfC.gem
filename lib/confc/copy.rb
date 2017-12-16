require 'fileutils'

require_relative 'display_verbose'
require_relative 'gethome'

##
# ConfC
module ConfC
  ##
  # Copy given file to current working directory.
  def self.copy(src, options = { verbose: false, overwrite: false })
    return false unless File.exist?(src) # Stop if no src file

    # Stop if dest file exists & prevent overwriting
    src_filename = File.basename(src)
    dest_path = File.expand_path(src_filename, Dir.pwd)
    return false if File.exist?(dest_path) && !options[:overwrite]

    FileUtils.copy(src, Dir.pwd)

    # Display verbose
    dest = File.expand_path(src_filename, Dir.pwd)
    ConfC.display_verbose(src, dest) if options[:verbose]

    true
  end
end
