require 'open-uri'
require 'json'

  def turn_url_into_hash(url_string)
    url = URI.encode(url_string)
    string = open(url).read
    hash = JSON.parse(string)

    return hash
  end

  def google_directions(start, finish)
  hash = turn_url_into_hash("http://maps.googleapis.com/maps/api/geocode/json?address=#{start}&sensor=false")

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


    return directions_hash
  end

puts google_directions("624 Central Street", "Merchandise Mart Chicago")

