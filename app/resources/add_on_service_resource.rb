class AddOnServiceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :fast_charge, :boolean
  attribute :regular_charge, :boolean
  attribute :interior_cleaning, :boolean
  attribute :exterior_cleaning, :boolean
  attribute :daily_checks, :boolean
  attribute :scheduled_maintenance, :boolean
  attribute :maintenance_datetime, :datetime
  attribute :maintenance_location, :string
  attribute :request_id, :integer

  # Direct associations

  belongs_to :request

  # Indirect associations
end
