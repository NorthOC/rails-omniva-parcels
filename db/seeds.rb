# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

#omniva data
puts "loading json data..."
data = URI.open('https://www.omniva.lt/locations.json')
data = JSON.load(data)
puts "complete!"

#clean up
puts "deleting previous data..."
Machine.delete_all()
puts "complete!"

#populate db
puts "Repopulating database..."
data.each_with_index do |item, index|

  #generate full adress for (used in filtering)
  if item["A8_NAME"] != ""
    adress = [item["A5_NAME"] + " " + item["A7_NAME"] + "-" + item["A8_NAME"], item["A2_NAME"], item["A1_NAME"]]
  else
    adress = [item["A5_NAME"] + " " + item["A7_NAME"], item["A2_NAME"], item["A1_NAME"]]
  end
  addr_string = ""
  adress.each do |piece|
    if piece != ""
      addr_string += piece + ", "
    end
  end
  addr_string += item["A0_NAME"]

  puts "#{index}: adding #{item["NAME"]}"

  thing = Machine.new(
    id: index,
    ZIP: item["ZIP"], 
    NAME: item["NAME"], 
    TYPE: item["TYPE"], 
    A0_NAME: item["A0_NAME"], 
    A1_NAME: item["A1_NAME"], 
    A2_NAME: item["A2_NAME"], 
    A3_NAME: item["A3_NAME"], 
    A4_NAME: item["A4_NAME"], 
    A5_NAME: item["A5_NAME"], 
    A6_NAME: item["A6_NAME"], 
    A7_NAME: item["A7_NAME"], 
    A8_NAME: item["A8_NAME"],
    X_COORDINATE: item["X_COORDINATE"], 
    Y_COORDINATE: item["Y_COORDINATE"], 
    SERVICE_HOURS: item["SERVICE_HOURS"], 
    TEMP_SERVICE_HOURS: item["TEMP_SERVICE_HOURS"], 
    TEMP_SERVICE_HOURS_UNTIL: item["TEMP_SERVICE_HOURS_UNTIL"], 
    TEMP_SERVICE_HOURS_2: item["TEMP_SERVICE_HOURS_2"], 
    TEMP_SERVICE_HOURS_2_UNTIL: item["TEMP_SERVICE_HOURS_2_UNTIL"], 
    comment_est: item["comment_est"], 
    comment_eng: item["comment_eng"], 
    comment_rus: item["comment_rus"], 
    comment_lav: item["comment_lav"], 
    comment_lit: item["comment_lit"], 
    MODIFIED: item["MODIFIED"],
    #adress for easier db filtering
    FULL_ADDRESS: addr_string
  )

  thing.save

end
puts "all done!"
puts "NOTE: id of first item is #{Machine.first.id} and last item is #{Machine.last.id}"