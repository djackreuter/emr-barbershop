require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password', country_code: '1', phone_number: '5055551234').save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: Faker::Internet.user_name, password: 'password', password_confirmation: 'password', country_code: '1', phone_number: '5055551234').save
      expect(user).to eq(false)
    end

    it 'ensures phone number presence' do
      user = User.new(name: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', country_code: '1').save
      expect(user).to eq(false)
    end

    it 'ensures user is created' do
      user = User.new(name: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', country_code: '1', phone_number: '5055551234').save
      expect(user).to eq(true)
    end
  end
end
