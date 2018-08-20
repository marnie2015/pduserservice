class Resolvers::UpdateUserRole < GraphQL::Function
  argument :user_id, !types.ID
  argument :role, !types.String

  type do
    name 'UpdateUserRole'
    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      User.find(args[:user_id]).update(role: args[:role])
      message = 'User role successfully updated!'
    end

    OpenStruct.new({
      message: message
    })
  end
end
