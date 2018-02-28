class ApplicationMailer < ActionMailer::Base
  default from: 'admin@emr-barbershop.com'
  layout 'mailer'
  # def send_confirmation_email(user)
  #   @user = user
  #   mail to: @user.email, subject: 'Please Confirm Your Account'
  # end
end
