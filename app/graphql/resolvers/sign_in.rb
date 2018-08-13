class Resolvers::SignIn < GraphQL::Function
  argument :email_address, !types.String
  argument :password, !types.String

  type do
    name 'SigninPayload'

    field :token, types.String
  end

  def call(_obj, args, _ctx)
    token = nil
    user = User.where(email_address: args[:email_address], password: encryptpass(args[:password])).first

    unless user.nil?
      payload = { email_address: user.try(:email_address), password: user.try(:password) }
      token = JsonWebToken.encode(payload)
    end

    OpenStruct.new({
      token: token
    })
  end

  def encryptpass(val)
    Digest::MD5.hexdigest(val)
  end

end
