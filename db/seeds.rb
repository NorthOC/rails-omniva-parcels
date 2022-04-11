# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

#omniva data
Rails.logger.info "loading json data..."
puts "loading json data..."
data = URI.open('https://www.omniva.lt/locations.json')
data = JSON.load(data)
Rails.logger.info "complete!"
puts "complete!"

#clean up
Rails.logger.info "deleting previous data..."
puts "deleting previous data..."
Machine.delete_all()
Rails.logger.info "complete!"
puts "complete!"

#populate db
Rails.logger.info "Repopulating database..."
puts "Repopulating database..."
data.each_with_index do |item, index|

  #generate full adress for different cases (used in filtering)
  if item["A8_NAME"] != ""

    if item["A7_NAME"] == ""
    adress = [item["A6_NAME"], item["A8_NAME"], item["A3_NAME"], item["A2_NAME"], item["A1_NAME"]]
    else
      adress = [item["A5_NAME"] + " " + item["A7_NAME"] + "-" + item["A8_NAME"], item["A3_NAME"], item["A2_NAME"], item["A1_NAME"]]
    end

  elsif item["A6_NAME"] != ""
    adress = [item["A6_NAME"], item["A3_NAME"], item["A2_NAME"], item["A1_NAME"]]
  elsif item["A5_NAME"] != ""
    adress = [item["A5_NAME"] + " " + item["A7_NAME"], item["A3_NAME"], item["A2_NAME"], item["A1_NAME"]]
  else
    adress = [item["A3_NAME"], item["A2_NAME"], item["A1_NAME"]]
  end

  addr_string = ""
  adress.each do |piece|
    if piece != ""
      addr_string += piece + ", "
    end
  end
  addr_string += item["A0_NAME"]

  puts item
  Rails.logger.info "#{index}: adding #{item["NAME"]}"
  puts "#{index}: adding #{item["NAME"]}"

  thing = Machine.new(
    id: index,
    zip: item["ZIP"], 
    name: item["NAME"], 
    TYPE: item["TYPE"], 
    a0_name: item["A0_NAME"], 
    a1_name: item["A1_NAME"], 
    a2_name: item["A2_NAME"], 
    a3_name: item["A3_NAME"], 
    a4_name: item["A4_NAME"], 
    a5_name: item["A5_NAME"], 
    a6_name: item["A6_NAME"], 
    a7_name: item["A7_NAME"], 
    a8_name: item["A8_NAME"],
    x_coordinate: item["X_COORDINATE"], 
    y_coordinate: item["Y_COORDINATE"], 
    service_hours: item["SERVICE_HOURS"], 
    temp_service_hours: item["TEMP_SERVICE_HOURS"], 
    temp_service_hours_until: item["TEMP_SERVICE_HOURS_UNTIL"], 
    temp_service_hours_2: item["TEMP_SERVICE_HOURS_2"], 
    temp_service_hours_2_until: item["TEMP_SERVICE_HOURS_2_UNTIL"], 
    comment_est: item["comment_est"], 
    comment_eng: item["comment_eng"], 
    comment_rus: item["comment_rus"], 
    comment_lav: item["comment_lav"], 
    comment_lit: item["comment_lit"], 
    modified: item["MODIFIED"],
    #adress for easier db filtering
    full_address: addr_string
  )

  thing.save

end
Rails.logger.info "all done!"
puts "all done!"
Rails.logger.info "NOTE: id of first item is #{Machine.first.id} and last item is #{Machine.last.id}"
puts "NOTE: id of first item is #{Machine.first.id} and last item is #{Machine.last.id}"