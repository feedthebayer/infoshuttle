class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :email, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    on: :create,
    message: "Whoa there hotrod, you must enter a valid email address"
  }
  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
end
