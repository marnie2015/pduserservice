class Resolvers::SignIn < GraphQL::Function
  argument :email, !types.String
  argument :pass, !types.String

  type do
    name 'SigninPayload'

    field :token, types.String
  end

  def call(_obj, args, _ctx)
    token = nil
    user = User.find_by(email: args[:email]).try(:authenticate, args[:pass])

    unless user.nil?
      payload = {
        id: user.try(:id),
        email: user.try(:email),
        designation: user.try(:designation),
        mobile_number: user.try(:mobile_number)
      }
      token = JsonWebToken.encode(payload)
    end

    OpenStruct.new({
      token: token
    })
  end

end
