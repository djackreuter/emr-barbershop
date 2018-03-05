class Member < ApplicationRecord
  belongs_to :barbershop
  belongs_to :user
end
