class UserMailer < ApplicationMailer
  def forgot_password(email, token)
    @reset_password_token = token
    mail(to: email, subject: 'Reset password link')
  end
end
