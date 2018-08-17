Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :myProfile, function: Resolvers::MyProfile.new
end
