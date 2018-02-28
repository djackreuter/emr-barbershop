class UserMailer < ActionMailer::Base
  default from: 'admin@emr-barbershop.com'
  def send_confirmation_email(user)
    @user = user
    mail to: @user.email, subject: 'Please Confirm Your Account'
  end
end
