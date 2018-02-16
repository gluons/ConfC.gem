require 'active_support/core_ext/hash/keys'
require 'mysticonfig'

require_relative 'files'
require_relative 'gethome'

DEFAULT_CONFIG = {
  'path' => ConfC.gethome,
  'files' => ConfC.files,
  'overwrite' => false,
  'verbose' => false,
  'yes' => false
}.freeze

##
# ConfC
module ConfC
  ##
  # Load ConfC configuration.
  def self.load_config
    loader = Mysticonfig::Loader.new('confc', DEFAULT_CONFIG)
    config = loader.load
    if config.empty?
      DEFAULT_CONFIG.symbolize_keys
    else
      # Truncate un-related config
      config = config.select { |k, _| DEFAULT_CONFIG.keys.include? k }
      config.symbolize_keys
    end
  end
end
