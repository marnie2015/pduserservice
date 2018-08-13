class Resolvers::ChangePassword < GraphQL::Function
  argument :token, !types.String
  argument :email_address, !types.String
  argument :password, !types.String

  type do
    name 'ChangePassword'

    field :password, types.String
  end

  def call(_obj, args, _ctx)
    pass = args[:password]
    dtoken = JsonWebToken.decode(args[:token])

    if dtoken != 'Invalid Access Token.'
      user = User.where(email_address: args[:email_address]).first

      if user.nil?
        pass = 'Record not found!'
      else
        user.update(password: encryptpass(pass))
      end

    else
      pass = 'Invalid Access Token.'
    end

    OpenStruct.new({
      password: pass
    })

  end

  def encryptpass(val)
    Digest::MD5.hexdigest(val)
  end

  def stringfy_json(val, col)
    val.to_s[/\"#{col}"\=>?\"([a-zA-Z ]+)/].gsub(/\"#{col}"\=>?\"/, '')
  end

end
