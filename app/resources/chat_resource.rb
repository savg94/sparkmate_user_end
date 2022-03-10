class ChatResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :provider_id, :integer
  attribute :message, :string
  attribute :gig_id, :integer

  # Direct associations

  belongs_to :gig

  belongs_to :provider

  belongs_to :user

  # Indirect associations
end
