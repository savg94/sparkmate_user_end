json.extract! gig, :id, :request_id, :provider_id, :status, :created_at, :updated_at
json.url gig_url(gig, format: :json)
