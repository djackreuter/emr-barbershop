class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @barbershops = @user.barbershops
  end

  def edit
    @user = User.find(params[:id])
    @barbershops = @user.barbershops
  end

  def new
    @user = User.new
    @user.barbershops.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver_later
      flash[:alert] = "An email was sent to #{@user.email}. Click the link to confirm your account"
      redirect_to root_path
    else
      redirect_to root_path
      flash[:alert] = 'There was a problem with one of your fields, please try again.'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:alert] = 'Profile updated successfully'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Couldn\'t update profile something went wrong.'
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = 'Account deleated successfully :('
    redirect_to root_path
  end

  def confirm_email
    user = User.find_by_confirm_token(params.dig(:id))
    if user
      user.email_activate
      flash[:alert] = 'Your email has been confirmed, please sign in to continue'
      redirect_to root_path
    else
      flash[:alert] = 'User does not exist'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :country_code, :password, :password_confirmation, barbershops_attributes: [:id, :barbershop_name, :bio, :price])
  end
end
