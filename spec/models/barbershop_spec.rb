require 'rails_helper'
require 'faker'

RSpec.describe Barbershop, type: :model do
  context 'validation tests' do
    it 'ensures barbershop name presence' do
      barbershop = Barbershop.new(bio: Faker::HowIMetYourMother.quote, price: 10).save
      expect(barbershop).to eq(false)
    end

    it 'ensures bio length is < 500' do
      barbershop = Barbershop.new(barbershop_name: 'The Happy Mullet', bio: Faker::Lorem.characters(501), price: 20).save
      expect(barbershop).to eq(false)
    end

    it 'ensures price is present' do
      barbershop = Barbershop.new(barbershop_name: 'The Happy Mullet', bio: Faker::HowIMetYourMother.quote).save
      expect(barbershop).to eq(false)
    end

    it 'ensures barbershop is saved' do
      barbershop = Barbershop.new(barbershop_name: 'The Happy Mullet', bio: Faker::HowIMetYourMother.quote, price: 10).save
      expect(barbershop).to eq(true)
    end

    it 'ensures barbershop name is unique' do
      barbershop = Barbershop.new(barbershop_name: 'The Happy Mullet', bio: Faker::HowIMetYourMother.quote, price: 10).save
      barbershop2 = Barbershop.new(barbershop_name: 'The Happy Mullet', bio: Faker::HowIMetYourMother.quote, price: 10).save
      expect(barbershop2).to eq(false)
    end
  end
end
