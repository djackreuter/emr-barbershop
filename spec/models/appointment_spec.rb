require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:barbershop){ Barbershop.new }
  before do
    barbershop.save(validate: false)
  end
  context 'validation tests' do
    it 'ensures customer name is present' do
      appt = Appointment.new(appt_time: Time.zone.now).save
      expect(appt).to eq(false)
    end

    it 'ensures appointment time is present' do
      appt = Appointment.new(cust_name: 'Jimmy Hopkins').save
      expect(appt).to eq(false)
    end

    it 'ensures appointment is created successfully' do
      appt = Appointment.new(barbershop: barbershop, cust_name: 'Jimmy Hopkins', appt_time: Time.zone.now).save
      expect(appt).to eq(true)
    end
  end
end
