require 'open-uri'
require 'json'

# http://maps.googleapis.com/maps/api/geocode/json?address=ENDING_POINT&sensor=false
# http://maps.googleapis.com/maps/api/directions/json?origin=START_LAT,START_LONG&destination=END_LAT,END_LONG&mode=transit&departure_time=TIME&sensor=false

def google_directions(start, finish)
  url = URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{start}&sensor=false")
  string = open(url).read
  hash = JSON.parse(string)

  start_lat = hash["results"].first["geometry"]["location"]["lat"]
  start_long = hash["results"].first["geometry"]["location"]["lng"]

  start_cords = [start_lat, start_long]

  url = URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{finish}&sensor=false")
  string = open(url).read
  hash = JSON.parse(string)

  finish_lat = hash["results"].first["geometry"]["location"]["lat"]
  finish_long = hash["results"].first["geometry"]["location"]["lng"]

  finish_cords = [finish_lat, finish_long]

  url = URI.encode("http://maps.googleapis.com/maps/api/directions/json?origin=#{start_cords.first},#{start_cords.last}&destination=#{finish_cords.first},#{finish_cords.last}&mode=transit&departure_time=#{Time.now.to_i}&sensor=false")
  string = open(url).read
  directions_hash = JSON.parse(string)


  return url
end

puts google_directions("624 Central Street", "Merchandise Mart Chicago")

