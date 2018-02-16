require 'optparse'
require 'rainbow'

require_relative 'ask_choose_files'
require_relative 'conf_clone'
require_relative 'files'
require_relative 'get_existent_files'
require_relative 'gethome'
require_relative 'load_config'
require_relative 'to_filenames'
require_relative 'version'

# rubocop:disable Layout/IndentHeredoc
BANNER = <<-BANNER.freeze
Usage: #{Rainbow('confc').green} [options] [filenames...]

Clone your default configuration files to current working directory.

BANNER
# rubocop:enable Layout/IndentHeredoc

AWW = '(｡◕‿◕｡)'.freeze

##
# ConfC
module ConfC
  # rubocop:disable Metrics/MethodLength, Metrics/LineLength, Metrics/AbcSize

  ##
  # ConfC's CLI class.
  class CLI
    ##
    # Start CLI.
    def self.start(argv)
      options = CLI.parse(argv)
      files = options[:files]

      confc_options = {
        overwrite: options[:overwrite],
        yes: options[:yes],
        verbose: options[:verbose]
      }
      existent_files = ConfC.get_existent_files(options[:path], files)
      chosen_files = options[:yes] ? existent_files : ConfC.ask_choose_files(existent_files)
      confc_result = ConfC.conf_clone(chosen_files, options[:path], confc_options)
      puts Rainbow("ConfC completed. #{AWW}").green if confc_result
    end

    ##
    # Parse CLI ARGV.
    def self.parse(argv)
      options = ConfC.load_config

      parser = OptionParser.new do |opts|
        opts.banner = BANNER

        opts.on('-p', '--path [PATH]', String, 'Path to configuration files') do |p|
          options[:path] = p
        end
        opts.on('-f', '--overwrite', 'Force to overwrite') do
          options[:overwrite] = true
        end
        opts.on('-y', '--yes', 'Say yes without inquiry') do
          options[:yes] = true
        end
        opts.on('-v', '--verbose', 'Display more information') do
          options[:verbose] = true
        end
        opts.on('-V', '--version', 'Show version number') do
          puts "v#{ConfC::VERSION}"
          exit
        end
        opts.on('-h', '--help', 'Show help') do
          puts opts
          exit
        end
      end
      files = parser.parse(argv)
      options[:files] = ConfC.to_filenames(files) if files.is_a?(Array) && !files.empty?

      options
    end

    # rubocop:enable Metrics/MethodLength, Metrics/LineLength, Metrics/AbcSize
  end
end
