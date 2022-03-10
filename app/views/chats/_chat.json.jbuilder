json.extract! chat, :id, :user_id, :provider_id, :message, :gig_id,
              :created_at, :updated_at
json.url chat_url(chat, format: :json)
