class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 60 }
  validates :password_digest, presence: true, length: { minimum: 6 }, on: :create
end
