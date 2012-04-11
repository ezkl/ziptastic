require "sqlite3"

module Ziptastic
  class NotZipCode < StandardError; end
  
  DATABASE_PATH = File.expand_path(File.dirname(__FILE__) + "/ziptastic/data/zipcodes.db")  
  ZIP_DATABASE = SQLite3::Database.open(DATABASE_PATH, :readonly => true, :results_as_hash => true)
  
  def self.search(zip_code)
    search_results = []
    
    search_results = search_for_zip_code(zip_code).collect do |row|
      {:city => row['city'], :state => row['state'], :country => row['country']}
    end
        
    search_results
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
require "ziptastic/app"
require "ziptastic/version"


