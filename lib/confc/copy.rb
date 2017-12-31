require 'fileutils'

require_relative 'ask_overwrite'
require_relative 'display_verbose'
require_relative 'gethome'

##
# ConfC
module ConfC
  ##
  # Should stop copying?
  def self.should_stop_copying?(
    src,
    dest_path,
    options = { overwrite: false }
  )
    # When dest file exist & no `overwrite`, ask to overwrite.
    File.exist?(dest_path) && !options[:overwrite] &&
      # When answer "don't overwrite", stop!.
      !ConfC.ask_overwrite(src, dest_path)
  end

  ##
  # Copy given file to current working directory.
  def self.copy(src, options = { overwrite: false, verbose: false })
    return false unless File.exist?(src) # Stop if no src file

    # Stop if dest file exists & prevent overwriting
    src_filename = File.basename(src)
    dest_path = File.expand_path(src_filename, Dir.pwd)
    return false if ConfC.should_stop_copying?(src, dest_path, options)

    FileUtils.copy(src, Dir.pwd)

    # Display verbose
    dest = File.expand_path(src_filename, Dir.pwd)
    ConfC.display_verbose(src, dest) if options[:verbose]

    true
  end
end
