class Provider < ApplicationRecord
  # Direct associations

  has_many   :chats,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
