Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signIn, function: Resolvers::SignIn.new
  field :changePassword, function: Resolvers::ChangePassword.new
end
