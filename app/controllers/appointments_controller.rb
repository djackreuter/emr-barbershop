class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @barbershop = Barbershop.find(params[:barbershop_id])
  end

  def create
    @barbershop = Barbershop.find(params[:barbershop_id])
    @appointment = @barbershop.appointments.build
  end
end
