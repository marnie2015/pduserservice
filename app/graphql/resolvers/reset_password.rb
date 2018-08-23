class Resolvers::ResetPassword < GraphQL::Function
  argument :reset_password_token, !types.String
  argument :new_pass, !types.String
  argument :confirm_pass, !types.String

  type do
    name 'ResetPassword'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    user = User.find_by(reset_password_token: args[:reset_password_token])
    if user
      message = user.update(password: args[:new_pass], password_confirmation: args[:confirm_pass], reset_password_token: nil) == true ?
        'Password reset successful!' : 'Invalid confirmation password!'
    else
      message = 'Invalid Token.'
    end

    OpenStruct.new({
      message: message
    })
  end
end
