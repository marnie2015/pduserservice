Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :tesField, types.String do
    resolve ->(obj, args, ctx) {
      'Hello World!'
    }
  end

  # field :signIn, types.String do
  #   description 'Login function'
  #   argument :email_address, !types.String
  #   argument :password, !types.String

  #   resolve ->(obj, args, ctx) {
  #     user = User.where(email_address: args[:email_address], password: encryptpass(args[:password])).first
  #     payload = { email_address: user.try(:email_address), password: user.try(:password) }
  #     token = JsonWebToken.encode(payload)
  #   }

  #   def encryptpass(val)
  #     Digest::MD5.hexdigest(val)
  #   end
  # end
end
