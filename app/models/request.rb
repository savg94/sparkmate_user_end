class Request < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    pickup_datetime
  end

end
