class Chat < ApplicationRecord
  # Direct associations

  belongs_to :gig

  belongs_to :provider,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
