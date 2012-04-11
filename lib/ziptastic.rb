require "sqlite3"
require "ostruct"

module Ziptastic
  class NotZipCode < StandardError; end
  class Region < OpenStruct; end
  
  DATABASE_PATH = File.expand_path(File.dirname(__FILE__) + "/ziptastic/data/zipcodes.db")  
  ZIP_DATABASE = SQLite3::Database.open(DATABASE_PATH, :readonly => true, :results_as_hash => true)
  
  def self.search(zip_code)
    search_results = search_for_zip_code(zip_code).inject([]) do |search_results, row|
      search_results << Region.new(:city => row['city'], :state => row['state'], :country => row['country'])
    end
        
    search_results.any? ? search_results : false
  end
  
  private
  def self.search_for_zip_code(zip_code)
    validate_zip_code(zip_code)
    ZIP_DATABASE.execute('select City, State, Country from zipcodes where ZipCode=?', zip_code)
  end
  
  def self.validate_zip_code(zip_code)
    raise NotZipCode, "#{zip_code} is not a zip code!" if zip_code =~ /\D/
  end
end

require "ziptastic/version"
