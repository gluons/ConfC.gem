require 'thor'

module ConfC
  ##
  # ConfC's CLI class.
  class CLI < Thor
    package_name 'ConfC'

    desc '', 'Clone your default configuration files to current working directory.'
    def execute
      puts 'Cloned.'
    end

    default_task :execute
  end
end
