class BarbershopsController < ApplicationController
  def index
    @barbershops = Barbershop.all
  end

  def show
    @barbershop = Barbershop.find(params[:id])
  end

  def new
    @barbershop = Barbershop.new
  end

  def create
    @barbershop = Barbershop.new(barbershop_params)
    if @barbershop.save
      flash[:alert] = 'Barbershop created successfuly'
      redirect_to barbershop_path(@barbershop)
    else
      flash[:alert] = 'Something went wrong please try again'
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def barbershop_params
    params.require(:barbershop).permit(:barbershop_name, :bio, :price)
  end
end
