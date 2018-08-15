class Resolvers::CreateUser < GraphQL::Function
  argument :email, !types.String
  argument :password, !types.String
  argument :designation, !types.String
  argument :mobile_number, !types.String

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
      email: args[:email],
      encrypted_password: args[:password],
      designation: args[:designation],
      mobile_number: args[:mobile_number]
    )
  end
end
