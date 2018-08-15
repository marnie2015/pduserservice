class Resolvers::SignIn < GraphQL::Function
  argument :email, !types.String
  argument :password, !types.String

  type do
    name 'SigninPayload'

    field :token, types.String
  end

  def call(_obj, args, _ctx)
    token = nil
    user = User.joins("left join agent_users on agent_users.user_id = users.id").where(email: args[:email]).first

    if user && BCrypt::Password.new(user.try(:encrypted_password)) == args[:password]
      payload = {
        id: user.try(:id),
        email: user.try(:email),
        encrypted_password: user.try(:encrypted_password),
        designation: user.try(:designation),
        mobile_number: user.try(:mobile_number),
        branch_name: user.agent_user.try(:branch_name),
        agent_id: user.agent_user.try(:agent_id),
        address: user.agent_user.try(:address),
        region: user.agent_user.try(:region),
        city: user.agent_user.try(:city),
        office_hours_start: user.agent_user.try(:office_hours_start),
        office_hours_end: user.agent_user.try(:office_hours_end),
      }
      token = JsonWebToken.encode(payload)
    end

    OpenStruct.new({
      token: token
    })
  end

end
