class ProviderResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :active_gigs,
             resource: GigResource

  has_many   :chats

  # Indirect associations

end
