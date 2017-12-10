confc_lib = File.expand_path('./confc', File.dirname(__FILE__)) # Path to ./confc
lib_files = Dir.entries(confc_lib).select { |f| f !~ /^(\.|\.\.)$/ } # All files exclude . and ..

lib_files.each { |f| require_relative "confc/#{f}" }
