require 'rainbow'

WTF = '(╯°□°）╯︵ ┻━┻'.freeze

##
# ConfC
module ConfC
  INTERRUPT_HANDLER = proc {
    puts
    puts Rainbow("ConfC stopped. #{WTF}").yellow
    exit(1)
  }
end
