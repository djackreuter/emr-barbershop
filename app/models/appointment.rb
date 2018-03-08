class Appointment < ApplicationRecord
  belongs_to :barbershop, inverse_of: :appointments
  validates :cust_name, presence: true
  validates :appt_time, presence: true
end
