Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signIn, function: Resolvers::SignIn.new
  field :changePassword, function: Resolvers::ChangePassword.new
  field :createRole, function: Resolvers::CreateRole.new
  field :createUser, function: Resolvers::CreateUser.new
  field :createAgent, function: Resolvers::CreateAgent.new
  field :createAgentUser, function: Resolvers::CreateAgentUser.new
  field :forgotPassword, function: Resolvers::ForgotPassword.new
  field :resetPassword, function: Resolvers::ResetPassword.new
end
