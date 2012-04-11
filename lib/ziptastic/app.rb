require "sinatra/base"
require "sinatra/json"
require "multi_json"

module Ziptastic
  class App < Sinatra::Base
    helpers Sinatra::JSON
    
    get '/' do
      results = Ziptastic.search(params[:zip])
      if results.any?
        json results.first
      else
        status 404
      end
    end
  end
end
