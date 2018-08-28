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

  connection :usersConnection, Types::UserType.connection_type do
    resolve ->(_obj, args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        User.all
      end
    }
  end

  field :users, types[Types::UserType] do
    resolve ->(_obj, args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        User.all
      end
    }
  end

  field :search_users, types[Types::UserType] do
    argument :email, types.String
    argument :designation, types.String
    resolve ->(_obj, args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        User.where("email ilike '#{args[:email]}%' and designation ilike '#{args[:designation]}'")
      end
    }
  end

  field :designations, types[Types::DesignationType] do
    resolve ->(_obj, args, ctx) {
      if ctx[:current_user] != 'Invalid Access Token.'
        User.all.select(:designation).group(:designation).order(:designation)
      end
    }
  end
end
