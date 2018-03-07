class Appointment < ApplicationRecord
  belongs_to :barbershop, inverse_of: :appointments
end
