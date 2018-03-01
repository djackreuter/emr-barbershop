class Barbershop < ApplicationRecord
  belongs_to :user, inverse_of: :barbershops
end
