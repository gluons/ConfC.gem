require 'optparse'
require 'rainbow'

require_relative 'conf_clone'
require_relative 'files'
require_relative 'gethome'
require_relative 'version'

BANNER = <<-BANNER.gsub(/^\s+/, '').freeze
  Usage: #{Rainbow('confc').green} [options] [filenames...]

  Clone your default configuration files to current working directory.
BANNER

DEFAULT_OPTIONS = {
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
    def self.start(argv)
      files = ConfC.files
      options = CLI.parse(argv)

      ConfC.conf_clone(files, options[:path], verbose: options[:verbose])
      puts Rainbow("ConfC completed. #{AWW}").green
    end

    # rubocop:disable Metrics/MethodLength, Metrics/LineLength
    def self.parse(argv)
      options = DEFAULT_OPTIONS.dup

      OptionParser.new do |opts|
        opts.banner = BANNER

        opts.on('-f', '--overwrite', 'Force to overwrite') do |overwrite|
          options[:overwrite] = overwrite
        end
        opts.on('-p', '--path [PATH]', String, 'Path to configuration files') do |p|
          options[:path] = p
        end
        opts.on('-v', '--verbose', 'Display more information') do
          options[:verbose] = true
        end
        opts.on('-V', '--version', 'Show version number') do
          puts ConfC::VERSION
          exit
        end
        opts.on('-h', '--help', 'Show help') do
          puts opts
          exit
        end

        opts.parse(argv)
      end

      options
    end
    # rubocop:enable Metrics/MethodLength, Metrics/LineLength
  end
end
