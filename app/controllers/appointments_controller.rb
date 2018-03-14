class AppointmentsController < ApplicationController
  # respond_to :js
  def new
    @appointment = Appointment.new(appt_time: Time.zone.now)
    @barbershop = Barbershop.find(params[:barbershop_id])
  end

  def create
    @barbershop = Barbershop.find(params[:barbershop_id])
    @appointment = @barbershop.appointments.create(appt_params)
    respond_to do |format|
      if @appointment.save
        flash[:alert] = 'Appointment created successfully'
        format.js
      else
        flash[:alert] = 'Something went wrong, please try again'
        render template: 'appointments/new'
      end
    end
  end

  def destroy
    @barbershop = Barbershop.find(params[:barbershop_id])
    @appointment = @barbershop.appointments.find(params[:id])
    @appointment.destroy
    redirect_to barbershop_path(@barbershop)
  end

  private

  def appt_params
    params.require(:appointment).permit(:cust_name, :appt_time)
  end
end
