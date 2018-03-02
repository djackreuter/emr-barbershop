class Barbershop < ApplicationRecord
  belongs_to :user, inverse_of: :barbershops
  validates :barbershop_name, presence: true
  validates :bio, length: { maximum: 500 }
end
