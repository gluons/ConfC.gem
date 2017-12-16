require 'optparse'
require 'rainbow'

require_relative 'conf_clone'
require_relative 'files'
require_relative 'gethome'
require_relative 'to_filenames'
require_relative 'version'

# rubocop:disable Layout/IndentHeredoc
BANNER = <<-BANNER.freeze
Usage: #{Rainbow('confc').green} [options] [filenames...]

Clone your default configuration files to current working directory.
BANNER
# rubocop:enable Layout/IndentHeredoc

DEFAULT_OPTIONS = {
  files: ConfC.files,
  path: ConfC.gethome,
  overwrite: false,
  verbose: false
}.freeze

AWW = '(｡◕‿◕｡)'.freeze

##
# ConfC
module ConfC
  ##
  # ConfC's CLI class.
  class CLI
    ##
    # Start CLI.
    def self.start(argv)
      options = CLI.parse(argv)
      files = options[:files]

      confc_options = {
        verbose: options[:verbose],
        overwrite: options[:overwrite]
      }
      confc_result = ConfC.conf_clone(files, options[:path], confc_options)
      puts Rainbow("ConfC completed. #{AWW}").green if confc_result
    end

    # rubocop:disable Metrics/MethodLength, Metrics/LineLength, Metrics/AbcSize
    ##
    # Parse CLI ARGV.
    def self.parse(argv)
      options = DEFAULT_OPTIONS.dup

      parser = OptionParser.new do |opts|
        opts.banner = BANNER

        opts.on('-f', '--overwrite', 'Force to overwrite') do
          options[:overwrite] = true
        end
        opts.on('-p', '--path [PATH]', String, 'Path to configuration files') do |p|
          options[:path] = p
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
