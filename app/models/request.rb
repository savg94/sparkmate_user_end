class Request < ApplicationRecord
  # Direct associations

  has_many   :active_gigs,
             :class_name => "Gig",
             :dependent => :destroy

  has_many   :add_on_services,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    pickup_datetime
  end

end
