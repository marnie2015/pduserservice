Types::DesignationType = GraphQL::ObjectType.define do
  name "Designation"

  field :designation, types.String
end
