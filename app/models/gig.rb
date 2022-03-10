class Gig < ApplicationRecord
  # Direct associations

  belongs_to :provider,
             :counter_cache => :active_gigs_count

  belongs_to :request

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    request.to_s
  end

end
