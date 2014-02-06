json.array!(@directions) do |direction|
  json.extract! direction, :id, :start, :finish
  json.url direction_url(direction, format: :json)
end
