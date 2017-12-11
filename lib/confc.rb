# Path to ./confc
confc_lib = File.expand_path('./confc', File.dirname(__FILE__))

# All files exclude . and ..
lib_files = Dir.entries(confc_lib).reject { |f| f =~ /^(\.|\.\.)$/ }

lib_files.each { |f| require_relative "confc/#{f}" }
