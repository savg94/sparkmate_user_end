json.extract! request, :id, :pickup_datetime, :pickup_location,
              :dropoff_datetime, :dropoff_location, :user_id, :created_at, :updated_at
json.url request_url(request, format: :json)
