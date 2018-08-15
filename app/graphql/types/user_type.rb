Types::UserType = GraphQL::ObjectType.define do
  name "User"

  field :id, types.ID
  field :email, types.String
  field :encrypted_password, types.String
  field :reset_password_token, types.String
  field :designation, types.String
  field :mobile_number, types.String
end
