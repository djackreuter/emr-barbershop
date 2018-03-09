class BarbershopsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :create, :destroy]
  def index
    @barbershops = Barbershop.all
  end

  def show
    @barbershop = Barbershop.find(params[:id])
    @users = @barbershop.users
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
      @barbershop.members.create(user_id: user_id_params[:user_ids])
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

  def user_id_params
    params.require(:users).permit(:user_ids)
  end
end
