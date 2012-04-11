require "sqlite3"
require "ostruct"
require "multi_json"

module Ziptastic
  ZIP_DATABASE = SQLite3::Database.new("zipcodes.db")
  def self.search(zip_code)
    valid_zip_code?(zip_code)
    result = ZIP_DATABASE.execute('select Country, State, City from zipcodes where ZipCode=?', zip_code)
  end
  
  private
  def self.valid_zip_code?(zip_code)
    unless zip_code =~ /[^a-zA-Z]/
      raise NotZipCode, "#{zip_code} is not a zip code!"
    end
  end
  
  class NotZipCode < StandardError; end
end

puts Ziptastic.search("16335")