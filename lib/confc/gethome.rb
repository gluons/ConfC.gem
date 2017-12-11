##
# ConfC
module ConfC
  ##
  # Get user's home directory.
  def self.gethome
    File.expand_path '~'
  end
end
