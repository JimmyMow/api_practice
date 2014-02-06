require 'open-uri'
require 'json'
# http://maps.googleapis.com/maps/api/geocode/json?address=STARTING_POINT&sensor=false
# http://maps.googleapis.com/maps/api/geocode/json?address=ENDING_POINT&sensor=false
# http://maps.googleapis.com/maps/api/directions/json?origin=START_LAT,START_LONG&destination=END_LAT,END_LONG&mode=transit&departure_time=TIME&sensor=false

def google_directions(start, finish)
  url = URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{start}&sensor=false")
  string = open(url).read
  hash = JSON.parse(string)

  return hash
end

puts google_directions("624 Central Street", "Merchandise Mart Chicago")
