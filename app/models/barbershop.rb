class Barbershop < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  validates :barbershop_name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :price, presence: true
end
