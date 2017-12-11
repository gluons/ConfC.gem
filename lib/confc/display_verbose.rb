require 'rainbow'

##
# ConfC
module ConfC
  ##
  # Display verbose information.
  def self.display_verbose(src, dest)
    verbose = Rainbow('Copied "').green
    verbose += Rainbow(src).cyan
    verbose += Rainbow('" to "').green
    verbose += Rainbow(dest).cyan
    verbose += Rainbow('".').green

    puts verbose
  end
end
