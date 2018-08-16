Types::AgentUserType = GraphQL::ObjectType.define do
  name "AgentUser"

  field :id, types.ID
  field :branch_name, !types.String
  field :agent_id, !types.Int
  field :user_id, !types.Int
  field :address, types.String
  field :region, types.String
  field :city, types.String
  field :office_hours_start, !types.String
  field :office_hours_end, !types.String
end
