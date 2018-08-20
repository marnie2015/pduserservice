Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :myProfile, function: Resolvers::MyProfile.new

  field :roles, types[Types::RoleType] do
    resolve ->(_obj, _args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        Role.all
      end
    }
  end

  field :user, Types::UserType do
    argument :id, !types.ID
    resolve ->(_obj, args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        User.where(id: args[:id]).first
      end
    }
  end
end
