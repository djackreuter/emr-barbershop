require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:barbershop) do
    barbershop = Barbershop.new(barbershop_name: 'The Rusty Razor', bio: Faker::HowIMetYourMother.quote, price: 10)
    barbershop.save(validate: false)
    barbershop
  end
  let(:user) do
    user = User.new(name: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', country_code: '1', phone_number: '5055551234')
    user.save(validate: false)
    user
  end
  context 'GET delete' do
    it 'logs the user out' do
      user
      get :destroy, params: { id: user.id }
      session[:user_id] = user.id
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to match(/Logged out/)
    end
  end

  context 'POST select_barbershop' do
    it 'logs in as barbershop' do
      user
      barbershop
      user.barbershop_ids = barbershop.id
      session[:user_id] = user.id
      post :select_barbershop, params: { barbershop_id: barbershop.id }
      session[:barbershop_id] = user.barbershop_ids
      expect(response).to redirect_to(edit_barbershop_path(user.barbershop_ids))
    end
  end
end
