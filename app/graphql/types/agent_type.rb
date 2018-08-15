Types::AgentType = GraphQL::ObjectType.define do
  name "Agent"

  field :id, types.ID
  field :cde, !types.String
  field :fullname, !types.String
end
