require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  let(:barbershop) do
    barbershop = Barbershop.new(barbershop_name: 'The Rusty Razor', bio: Faker::HowIMetYourMother.quote, price: 10)
    barbershop.save(validate: false)
    barbershop
  end

  context 'POST create' do
    it 'ensures an empty appointment wont save' do
      barbershop
      post :create, params: { appointment: { appt_name: nil, appt_time: nil } }
      expect(response).to render_template('/appointments/new')
    end
  end
end
