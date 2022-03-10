class Chat < ApplicationRecord
  # Direct associations

  belongs_to :gig

  belongs_to :provider,
             counter_cache: true

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  validates :gig_id, presence: true

  validates :message, presence: true

  validates :provider_id, presence: true

  validates :user_id, presence: true

  # Scopes

  def to_s
    user.to_s
  end
end
