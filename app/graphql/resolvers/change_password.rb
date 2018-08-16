class Resolvers::ChangePassword < GraphQL::Function
  argument :email, !types.String
  argument :pass, !types.String

  type do
    name 'ChangePassword'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      user = User.where(email: args[:email]).first

      if user.nil?
        message = 'Record not found!'
      else
        user.update(password: args[:pass])
        message = 'Password successfully changed!'
      end
    end

    OpenStruct.new({
      message: message
    })
  end
end
