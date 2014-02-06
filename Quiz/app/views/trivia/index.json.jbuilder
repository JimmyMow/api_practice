json.array!(@trivia) do |trivium|
  json.extract! trivium, :id, :title
  json.url trivium_url(trivium, format: :json)
end
