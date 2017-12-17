$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if RUBY_VERSION < '1.9.3'
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each do |f|
    require File.join(File.dirname(f), File.basename(f, '.rb'))
  end
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each do |f|
    require File.join(File.dirname(f), File.basename(f, '.rb'))
  end
else
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each do |f|
    require_relative f
  end
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each do |f|
    require_relative f
  end
end
