#!/usr/bin/ruby
require 'json' # Require JSON Gem.
def convertJSONFromFileToString(fileObject)
  file = File.read(fileObject) # Store A File Object In The Read State.
  data_hash = JSON.parse(file) # Parse the Json file and store in a hash array.

  # Optional Fields - If Exists Then Set String Variable.
  if data_hash['subpremise']
    subpremise = "#{data_hash['subpremise']}, "
  end
  if data_hash['house_name'] # This along with House number is conditional given OR notation.
    house_name = "#{data_hash['house_name']}, "
  end
  if data_hash['house_number']
    house_number = "#{data_hash['house_number']} "
  end
  if data_hash['street_line_2']
    street_line_2 = "\n#{data_hash['street_line_2']},\n"
  end
  if data_hash['region']
    region = "\n#{data_hash['region']},"
  end

  # Print Correct Format Of Mandatory And Optional Fields. (uses expressions)
  puts "#{subpremise}#{house_name}\n#{house_number}#{data_hash['street_line_1']},#{street_line_2}\n#{data_hash['town_or_city']},#{region}\n#{data_hash['postcode']}\n"
end

# Method Call To First Commandline Argument.
convertJSONFromFileToString(ARGV.first)
