# Ziptastic Ruby
A simple Ruby port of Thomas Schultz's [Ziptastic](https://github.com/daspecster/ziptastic) zip code API.

## Installation

Add this line to your application's Gemfile:

    gem 'ziptastic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ziptastic

## Usage
To search against the database locally:

    require 'ziptastic'
    results = Ziptastic.search("16335")
      # => [  {:city=>"MEADVILLE", :state=>"PA", :country=>"US"},
      #       {:city=>"BLOOMING VALLEY", :state=>"PA", :country=>"US"},
      #       {:city=>"KERRTOWN", :state=>"PA", :country=>"US"} ]
      
Local database searches often return multiple results for a single zip code.

Alternatively, an executable is also included that provides a search API via Sinatra:

    $ ziptastic
    $ curl http://localhost:5678?zip=16335
      # => {"city":"MEADVILLE","state":"PA","country":"US"}

The web API is compatible with the [example JS script](http://daspecster.github.com/ziptastic/demo.html) provided by Thomas Schultz. You'll just need to update the client URL.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
