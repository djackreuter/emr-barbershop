class Barbershop < ApplicationRecord
  has_many :appointments, inverse_of: :barbershop, dependent: :destroy
  has_many :members
  has_many :posts, as: :postable, dependent: :destroy
  has_many :users, through: :members
  validates :barbershop_name, presence: true
  validates :bio, length: { maximum: 500 }
  validates :price, presence: true

  def view_name
    barbershop_name
  end
end
