require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    user =  User.new(name: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password', password_confirmation: 'password', country_code: '1', phone_number: '5055551234')
    user.save(validate: false)
    # session[:user_id] = user.id
    user
  end
  context 'GET show' do
    it 'renders the show view' do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  context 'POST create' do
    it 'creates a user' do
      user
      post :create, params: { user: { name: user.name, email: user.email, password: user.password, password_confirmation: user.password_confirmation, country_code: user.country_code, phone_number: user.phone_number } }
      expect(flash[:alert]).to match(/confirm/) 
    end
  end

  context 'PATCH update' do
    it 'makes sure user is updated successfully' do
      user
      user.email_confirmed = true
      user.confirm_token = nil
      session[:user_id] = user.id
      patch :update, params: { id: user.id, user: { password: 'password123', password_confirmation: 'password123'} }
      expect(response).to redirect_to("/users/#{user.id}")
    end
  end

  context 'DELETE destroy' do
    it 'deletes the user' do
      user
      session[:user_id] = user.id
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to match(/deleted/)
    end
  end

  context 'GET confirm_email' do
    it 'makes sure email has been confirmed' do
      user
      get :confirm_email, params: { id: user.confirm_token }
      user.email_confirmed = true
      user.confirm_token = nil
      expect(flash[:alert]).to match(/confirmed/)
    end
  end
end
