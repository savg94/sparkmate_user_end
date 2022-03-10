class Provider < ApplicationRecord
  # Direct associations

  has_many   :active_gigs,
             class_name: "Gig",
             dependent: :nullify

  has_many   :chats,
             dependent: :nullify

  # Indirect associations

  has_many   :requests,
             through: :active_gigs,
             source: :request

  has_many   :users,
             through: :requests,
             source: :user

  # Validations

  validates :last_name, presence: true

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
