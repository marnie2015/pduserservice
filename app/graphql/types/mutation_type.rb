Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :signIn, function: Resolvers::SignIn.new
end
