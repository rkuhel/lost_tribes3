json.array!(@events) do |event|
  json.extract! event, :title, :description, :image_url, :street, :street2, :city, :state, :zip, :start_date, :start_time, :end_date, :end_time, :creator_id, :price
  json.url event_url(event, format: :json)
end
