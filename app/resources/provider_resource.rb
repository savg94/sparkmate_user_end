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

  many_to_many :requests

  has_many :users do
    assign_each do |provider, users|
      users.select do |u|
        u.id.in?(provider.users.map(&:id))
      end
    end
  end


  filter :user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:users).where(:requests => {:user_id => value})
    end
  end
end
