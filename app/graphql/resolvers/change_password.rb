class Resolvers::ChangePassword < GraphQL::Function
  argument :email_address, !types.String
  argument :password, !types.String

  type do
    name 'ChangePassword'

    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      user = User.where(email_address: args[:email_address]).first

      if user.nil?
        message = 'Record not found!'
      else
        user.update(password: encryptpass(args[:password]))
        message = 'Password successfully changed!'
      end
    end

    OpenStruct.new({
      message: message
    })
  end

  def encryptpass(val)
    Digest::MD5.hexdigest(val)
  end
end
