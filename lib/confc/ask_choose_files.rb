require 'rainbow'
require 'tty-prompt'

require_relative 'interrupt_handler'

APP_NAME = Rainbow('ConfC').green

#
## ConfC
module ConfC
  #
  ## Ask to choose existent files to clone.
  def self.ask_choose_files(existent_files)
    prompt = TTY::Prompt.new(interrupt: ConfC::INTERRUPT_HANDLER)
    prompt.multi_select("Which files that you want to #{APP_NAME}?") do |menu|
      menu.default(*(1..existent_files.length))
      menu.choices existent_files
    end
  end
end
