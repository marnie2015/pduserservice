class Resolvers::MyProfile < GraphQL::Function
  type do
    name 'MyProfile'

    field :user, Types::UserType
    field :roles, types[Types::RoleType]
    field :agent, Types::AgentType
    field :agentuser, Types::AgentUserType
  end

  def call(_obj, args, ctx)
    user = ctx[:current_user]
    if user != 'Invalid Access Token.'
      roles = Role.where(id: user.role.split(','))
      agentuser = AgentUser.where(user_id: user.id).first
      agent = Agent.where(id: agentuser.try(:id)).first
    else
      user = User.new
      roles = Role.new
      agentuser = AgentUser.new
      agent = Agent.new
    end

    OpenStruct.new({
      user: user,
      roles: roles,
      agent: agent,
      agentuser: agentuser
    })
  end
end
