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

  def edit
    @barbershop = Barbershop.find(params[:id])
  end

  def update
    @barbershop = Barbershop.find(params[:id])
    if @barbershop.update(barbershop_params)
      flash[:alert] = 'Barbershop updated successfully'
      redirect_to barbershop_path(@barbershop)
    else
      flash[:alert] = 'Couldn\'t update profile something went wrong.'
      redirect_to edit_barbershop_path(@barbershop)
    end
  end

  def create
    @barbershop = Barbershop.new(barbershop_params)
    if @barbershop.save
      @barbershop.members.create(user_id: current_user.id)
      flash[:alert] = 'Barbershop created successfuly'
      redirect_to barbershop_path(@barbershop)
    else
      flash[:alert] = 'Something went wrong please try again'
      redirect_to edit_user_path(current_user)
    end
  end

  def destroy
    @barbershop = Barbershop.find(params[:id])
    @barbershop.destroy
    flash[:alert] = 'Barbershop deleted successfully'
    redirect_to root_path
  end

  private

  def barbershop_params
    params.require(:barbershop).permit(:barbershop_name, :bio, :price)
  end
end
