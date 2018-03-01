class SessionsController < ApplicationController
  def verify
    @user = User.find_by(id: session[:pre_2fa_id])
  end

  def check_2fa
    flash[:alert] = nil
    user = User.find(session[:pre_2fa_id])
    token = Authy::API.verify(id: user.authy_id, token: params[:token])
    if token.ok?
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:alert] = 'Login successful!'
      session[:pre_2fa_id] = nil
    else
      flash[:alert] = 'Sorry, code was incorrect'
      render template: 'sessions/create'
    end
  end

  def create
    user = User.find_by(email: params.dig(:email))
    if user && user.authenticate(params.dig(:password))
      if user.email_confirmed
        session[:pre_2fa_id] = user.id
        Authy::API.request_sms(id: user.authy_id)
        # redirect_to verify_path
        render template: 'sessions/create'
      else
        flash[:alert] = 'Please confirm your account first'
        render template: 'sessions/new'
      end
    else
      flash[:alert] = 'Email or password is incorrect'
      render template: 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:alert] = 'Logged out'
  end
end
