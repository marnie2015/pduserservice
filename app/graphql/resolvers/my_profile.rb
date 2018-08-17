class Resolvers::MyProfile < GraphQL::Function
  type do
    name 'MyProfile'

    field :user, Types::UserType
    field :roles, types[Types::RoleType]
    field :agent, Types::AgentType
    field :agentuser, Types::AgentUserType
  end

  def call(_obj, args, _ctx)
    usr = _ctx[:current_user]
    if usr != 'Invalid Access Token.'
      user = User.where(id: usr.try(:id)).first
      roles = Role.where(id: usr.role.split(','))
      agentuser = AgentUser.where(user_id: usr.id).first
      agent = Agent.where(id: agentuser.try(:id)).first
    end

    OpenStruct.new({
      user: user,
      roles: roles,
      agent: agent,
      agentuser: agentuser
    })
  end
end
