require 'fileutils'

require_relative 'get_home'

module ConfC
  ##
  # Copy given file to user's home directory.
  def self.copy(src)
    FileUtils.copy(src, get_home())
  end
end
