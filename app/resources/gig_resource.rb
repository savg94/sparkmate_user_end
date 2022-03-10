class GigResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :request_id, :integer
  attribute :provider_id, :integer
  attribute :status, :string

  # Direct associations

  # Indirect associations

end
