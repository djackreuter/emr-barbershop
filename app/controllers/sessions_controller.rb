class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params.dig(:email))
    if user && user.authenticate(params.dig(:password))
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to user_path(user)
        flash[:alert] = 'Login successful!'
      else
        flash[:alert] = 'Please confirm your account first'
      end
    else
      redirect_to root_path
      flash[:alert] = 'Email or password is incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:alert] = 'Logged out'
  end
end
