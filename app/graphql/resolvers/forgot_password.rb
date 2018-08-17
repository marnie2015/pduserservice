class Resolvers::ForgotPassword < GraphQL::Function
  argument :email, !types.String

  type do
    name 'ForgotPassword'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    token = nil
    user = User.find_by(email: args[:email])

    if user
      payload = {
        email: user.try(:email)
      }
      token = JsonWebToken.encode(payload)
      user.update(reset_password_token: token)
      UserMailer.forgot_password(user.email, user.reset_password_token).deliver
      message = "We've sent an email to your inbox!"
    else
      message = 'Email address not found!'
    end

    OpenStruct.new({
      message: message
    })
  end

end
