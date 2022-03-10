class AddOnService < ApplicationRecord
  # Direct associations

  belongs_to :request

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
