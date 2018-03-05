class Barbershop < ApplicationRecord
  has_many :users, inverse_of: :barbershop
  validates :barbershop_name, presence: true
  validates :bio, length: { maximum: 500 }
end
