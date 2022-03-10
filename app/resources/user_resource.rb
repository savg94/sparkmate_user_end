class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :last_name, :string

  # Direct associations

  has_many   :requests

  has_many   :chats

  # Indirect associations

  has_many :providers do
    assign_each do |user, providers|
      providers.select do |p|
        p.id.in?(user.providers.map(&:id))
      end
    end
  end

  filter :provider_id, :integer do
    eq do |scope, value|
      scope.eager_load(:providers).where(gigs: { provider_id: value })
    end
  end
end
