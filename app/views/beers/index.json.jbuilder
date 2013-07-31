json.array!(@beers) do |beer|
  json.extract! beer, :title, :description, :image_url, :price
  json.url beer_url(beer, format: :json)
end
