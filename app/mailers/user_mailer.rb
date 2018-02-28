class UserMailer < ActionMailer::Base
  default from: 'admin@emr-barbershop.com'
  def registration_confirmation(user)
    @user = user
    mail to: @user.email, subject: 'Please Confirm Your Account'
  end
end
