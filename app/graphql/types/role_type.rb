Types::RoleType = GraphQL::ObjectType.define do
  name 'Role'

  field :id, types.ID
  field :category, !types.String
  field :sub_category, !types.String
  field :url, !types.String
end
