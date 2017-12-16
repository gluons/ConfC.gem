##
# ConfC
module ConfC
  ##
  # Convert all raw file names to base file names.
  def self.to_filenames(raw_filenames)
    if raw_filenames.is_a?(Array) && !raw_filenames.empty?
      raw_filenames.map do |raw_filename|
        File.basename raw_filename
      end
    else
      []
    end
  end
end
