Types::RoleType = GraphQL::ObjectType.define do
  name 'RoleType'

  field :id, types.ID
  field :category, !types.String
  field :sub_category, !types.String
  field :url, !types.String
end
