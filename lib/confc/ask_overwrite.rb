require 'rainbow'
require 'tty-prompt'

require_relative 'interrupt_handler'

##
# ConfC
module ConfC
  ##
  # Ask to overwrite `dest` file with `src` file.
  def self.ask_overwrite(src, dest)
    colored_src = Rainbow(src).magenta
    colored_dest = Rainbow(dest).green
    prompt = TTY::Prompt.new(interrupt: ConfC::INTERRUPT_HANDLER)
    prompt.yes?(
      %(Do you want to overwrite "#{colored_src}" with "#{colored_dest}"?)
    )
  end
end
