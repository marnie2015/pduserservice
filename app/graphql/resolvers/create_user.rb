class Resolvers::CreateUser < GraphQL::Function
  argument :email, !types.String
  argument :pass, !types.String
  argument :designation, !types.String
  argument :mobile_number, !types.String
  argument :role, !types.String

  type do
    name 'CreateUser'
    field :message, types.String
  end

  def call(_obj, args, _ctx)
    message = _ctx[:current_user]
    if message != 'Invalid Access Token.'
      User.create!(
        email: args[:email],
        password: args[:pass],
        designation: args[:designation],
        mobile_number: args[:mobile_number],
        role: args[:role]
      )
      message = 'User successfully added!'
    end

    OpenStruct.new({
      message: message
    })

  end
end
