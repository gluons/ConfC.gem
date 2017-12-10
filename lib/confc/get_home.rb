module ConfC
  ##
  # Get user's home directory.
  def self.get_home
    File.expand_path '~'
  end
end
