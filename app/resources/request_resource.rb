class RequestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :pickup_datetime, :datetime
  attribute :pickup_location, :string
  attribute :dropoff_datetime, :datetime
  attribute :dropoff_location, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :active_gigs,
             resource: GigResource

  has_many   :add_on_services

  belongs_to :user

  # Indirect associations

end
