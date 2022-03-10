class User < ApplicationRecord
  # Direct associations

  has_many   :requests,
             :dependent => :nullify

  has_many   :chats,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
