class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver_later
      flash[:alert] = "An email was sent to #{@user.email}. Click the link to confirm your account"
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong, could not register user'
    end
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
    params.require(:user).permit(:name, :email, :phone_number, :country_code, :password, :password_confirmation, barbershops_attributes: [:id, :barbershop_name, :price])
  end
end
