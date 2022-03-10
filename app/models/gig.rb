class Gig < ApplicationRecord
  # Direct associations

  belongs_to :request

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    request.to_s
  end

end
