class Resolvers::CreateAgentUser < GraphQL::Function
  argument :agent_id, !types.ID
  argument :user_id, !types.ID
  argument :branch_name, !types.String
  argument :address, !types.String
  argument :region, !types.String
  argument :city, !types.String
  argument :office_hours_start, types.String
  argument :office_hours_end, types.String

  type do
    name 'CreateAgentUser'

    field :message, types.String
  end

  def call(_obj, args, ctx)
    message = ctx[:current_user]
    if message != 'Invalid Access Token.'
      AgentUser.create!(
        agent_id: args[:agent_id],
        user_id: args[:user_id],
        branch_name: args[:branch_name],
        address: args[:address],
        region: args[:region],
        city: args[:city],
        office_hours_start: args[:office_hours_start],
        office_hours_end: args[:office_hours_end]
      )
      message = 'Agent User successfully added!'
    end

    OpenStruct.new({
      message: message
    })
  end
end
